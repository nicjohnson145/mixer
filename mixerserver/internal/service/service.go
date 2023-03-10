package service

import (
	"context"

	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/rs/zerolog"
	"github.com/samber/lo"
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
		return nil, wrapStorageErrors(err)
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

func (s *Service) ListUsers(ctx context.Context, req *pb.ListUsersRequest) (*pb.ListUsersResponse, error) {
	users, err := s.store.GetPublicUsers()
	if err != nil {
		s.log.Err(err).Msg("error getting users")
		return nil, wrapStorageErrors(err)
	}
	return &pb.ListUsersResponse{
		Users: users,
	}, nil
}

func (s *Service) CreateDrink(ctx context.Context, req *pb.CreateDrinkRequest) (*pb.CreateDrinkResponse, error) {
	if err := validateDrinkWriteRequest(req.DrinkData); err != nil {
		s.log.Err(err).Msg("error validating create request")
		return nil, err
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	id, err := s.store.CreateDrink(claims.Username, req.DrinkData)
	if err != nil {
		s.log.Err(err).Msg("error persisting drink")
		return nil, wrapStorageErrors(err)
	}

	return &pb.CreateDrinkResponse{Id: int64(id)}, nil
}

func (s *Service) ReadDrink(ctx context.Context, req *pb.GetDrinkRequest) (*pb.GetDrinkResponse, error) {
	if req.Id == 0 {
		return nil, singleFieldViolation("id", "id must be set")
	}
	data, err := s.store.GetDrink(req.Id)
	if err != nil {
		s.log.Err(err).Msg("error reading drink")
		return nil, wrapStorageErrors(err)
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	if !canViewDrink(claims, data) {
		return nil, status.Error(codes.NotFound, "not found")
	}

	return &pb.GetDrinkResponse{Drink: data}, nil
}

func (s *Service) UpdateDrink(ctx context.Context, req *pb.UpdateDrinkRequest) (*pb.UpdateDrinkResponse, error) {
	if err := validateDrinkWriteRequest(req.DrinkData); err != nil {
		s.log.Err(err).Msg("error validating create request")
		return nil, err
	}

	if req.Id == 0 {
		return nil, singleFieldViolation("id", "id required for update")
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	err = s.store.UpdateDrink(claims.Username, req.Id, req.DrinkData)
	if err != nil {
		s.log.Err(err).Msg("error persisting drink")
		return nil, wrapStorageErrors(err)
	}

	return &pb.UpdateDrinkResponse{}, nil
}

func (s *Service) ListDrinks(ctx context.Context, req *pb.ListDrinkRequest) (*pb.ListDrinkResponse, error) {
	if req.Username == "" {
		return nil, singleFieldViolation("username", "username is required")
	}

	drinks, err := s.store.ListDrinkByUsername(req.Username)
	if err != nil {
		s.log.Err(err).Msg("error listing drinks")
		return nil, wrapStorageErrors(err)
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	filteredDrinks := lo.Filter(drinks, func(d *pb.Drink, _ int) bool {
		return canViewDrink(claims, d)
	})

	return &pb.ListDrinkResponse{
		Drinks: filteredDrinks,
	}, nil
}

func (s *Service) DeleteDrink(ctx context.Context, req *pb.DeleteDrinkRequest) (*pb.DeleteDrinkResponse, error) {
	if req.Id == 0 {
		return nil, singleFieldViolation("id", "id is required")
	}

	claims, err := jwtClaimsFromCtx(ctx)
	if err != nil {
		s.log.Err(err).Msg("error pulling claims from context")
		return nil, err
	}

	drink, err := s.store.GetDrink(req.Id)
	if err != nil {
		return nil, wrapStorageErrors(err)
	}

	if drink.Username != claims.Username {
		return nil, status.Error(codes.NotFound, "not found")
	}

	err = s.store.DeleteDrink(req.Id)
	if err != nil {
		return nil, wrapStorageErrors(err)
	}

	return &pb.DeleteDrinkResponse{}, nil
}
