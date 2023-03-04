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
	Logger  zerolog.Logger
	Storage storage.Storage
}

func NewService(conf ServiceConfig) *Service {
	return &Service{
		log:   conf.Logger,
		store: conf.Storage,
	}
}

type Service struct {
	log   zerolog.Logger
	store storage.Storage
	pb.UnimplementedUserServiceServer
}

func (s *Service) RegisterNewUser(ctx context.Context, req *pb.RegisterNewUserRequest) (*pb.RegisterNewUserResponse, error) {
	if req.Username == "" {
		return nil, singleFieldViolation("username", "username is required", "")
	}
	if req.Password == "" {
		return nil, singleFieldViolation("password", "password is required", "")
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
