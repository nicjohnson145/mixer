package service

import (
	"context"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/rs/zerolog"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type ServiceConfig struct {
	Logger           zerolog.Logger
	Storage          storage.Storage
	RefreshGenerator GenerationFunc
	AccessGenerator  GenerationFunc
}

func NewService(conf ServiceConfig) *Service {
	return &Service{
		log:              conf.Logger,
		store:            conf.Storage,
		accessGenerator:  conf.AccessGenerator,
		RefreshGenerator: conf.RefreshGenerator,
	}
}

type Service struct {
	log              zerolog.Logger
	store            storage.Storage
	accessGenerator  GenerationFunc
	RefreshGenerator GenerationFunc
	pb.UnimplementedUserServiceServer
	pb.UnimplementedDrinkServiceServer
}

func (s *Service) RegisterNewUser(ctx context.Context, req *pb.RegisterNewUserRequest) (*pb.RegisterNewUserResponse, error) {
	if req.Username == "" {
		return nil, singleFieldViolation("username", "username is required")
	}
	if req.Password == "" {
		return nil, singleFieldViolation("password", "password is required")
	}

	hashedPw, err := hashPassword(req.Password)
	if err != nil {
		s.log.Err(err).Msg("error hashing password")
		return nil, status.Errorf(codes.Internal, "error hashing password")
	}

	err = s.store.CreateUser(storage.User{
		Username: req.Username,
		Password: hashedPw,
	})
	if err != nil {
		s.log.Err(err).Msg("error persisting user")
		return nil, status.Errorf(codes.Internal, "error persisting user")
	}

	return &pb.RegisterNewUserResponse{}, nil
}

func (s *Service) Login(ctx context.Context, req *pb.LoginRequest) (*pb.LoginResponse, error) {
	if req.Username == "" {
		return nil, singleFieldViolation("username", "username is required")
	}
	if req.Password == "" {
		return nil, singleFieldViolation("password", "password is required")
	}

	user, err := s.store.ReadUser(req.Username)
	if err != nil {
		s.log.Err(err).Msg("error reading user from store")
		// TODO: this should be more fine grained
		return nil, status.Error(codes.PermissionDenied, "permission denied")
	}

	if !comparePasswords(user.Password, req.Password) {
		return nil, status.Error(codes.PermissionDenied, "permission denied")
	}

	access, err := s.accessGenerator(user)
	if err != nil {
		s.log.Err(err).Msg("error generating access token")
		return nil, status.Error(codes.PermissionDenied, "permission denied")
	}

	refresh, err := s.accessGenerator(user)
	if err != nil {
		s.log.Err(err).Msg("error generating refresh token")
		return nil, status.Error(codes.PermissionDenied, "permission denied")
	}

	return &pb.LoginResponse{
		Username:     user.Username,
		RefreshToken: refresh,
		AccessToken:  access,
	}, nil
}

func (s *Service) Create(ctx context.Context, req *pb.CreateDrinkRequest) (*pb.CreateDrinkResponse, error) {
	if err := validateDrinkWriteRequest(req.DrinkData); err != nil {
		s.log.Err(err).Msg("error validating create request")
		return nil, err
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	// TODO: pull from auth token
	id, err := s.store.CreateDrink(claims.Username, req.DrinkData)
	if err != nil {
		s.log.Err(err).Msg("error persisting drink")
		return nil, err
	}

	return &pb.CreateDrinkResponse{Id: int64(id)}, nil
}

func (s *Service) Read(ctx context.Context, req *pb.GetDrinkRequest) (*pb.GetDrinkResponse, error) {
	if req.Id == 0 {
		return nil, singleFieldViolation("id", "id must be set")
	}
	data, err := s.store.GetDrink(int(req.Id))
	if err != nil {
		s.log.Err(err).Msg("error reading drink")
		return nil, err
	}

	// TODO: check if auth token user can access this drink

	return &pb.GetDrinkResponse{Drink: data}, nil
}
