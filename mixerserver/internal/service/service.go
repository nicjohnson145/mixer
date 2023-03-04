package service

import (
	"fmt"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/rs/zerolog"
)

type HTTPServiceConfig struct {
	Logger  zerolog.Logger
	Storage storage.Storage
}

func NewHTTPService(conf HTTPServiceConfig) *HTTPService {
	return &HTTPService{
		log:   conf.Logger,
		store: conf.Storage,
	}
}

type HTTPService struct {
	log   zerolog.Logger
	store storage.Storage
}

func (h *HTTPService) RegisterRoutes(router *chi.Mux) {
	router.Use(middleware.Logger)
	router.Post("/api/v1/auth/register-user", pbJSONHandler(h.CreateUser))
}

func (h *HTTPService) CreateUser(req *pb.RegisterNewUserRequest) (*pb.RegisterNewUserResponse, error) {
	hashedPW, err := hashPassword(req.Password)
	if err != nil {
		return nil, fmt.Errorf("error hashing password: %w", err)
	}

	err = h.store.CreateUser(storage.User{Username: req.Username, Password: hashedPW})
	if err != nil {
		return nil, fmt.Errorf("error creating user: %w", err)
	}

	return &pb.RegisterNewUserResponse{}, nil
}
