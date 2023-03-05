package cmd

import (
	"context"
	"net"
	"net/http"
	"strings"

	"github.com/nicjohnson145/mixer/mixerserver/config"
	"github.com/nicjohnson145/mixer/mixerserver/internal/service"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/rs/zerolog"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func Root() *cobra.Command {
	root := &cobra.Command{
		Use:   "mixerserver",
		Short: "Start the backend service",
		PersistentPreRunE: func(cmd *cobra.Command, args []string) error {
			cmd.SilenceUsage = true
			cmd.SilenceErrors = true
			return config.InitializeConfig(cmd)
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			logger := config.InitLogger()

			db, err := connectDB()
			if err != nil {
				logger.Err(err).Msg("error connecting to DB")
				return err
			}

			logger.Info().Msg("executing migrations")
			err = storage.Migrate(db)
			if err != nil {
				logger.Err(err).Msg("error migrating")
				return err
			}

			store := storage.NewPostgresStore(storage.PostgresStoreConfig{
				Logger: config.WithComponent(logger, "storage"),
				DB: db,
			})

			svcLogger := config.WithComponent(logger, "service")
			service := service.NewService(service.ServiceConfig{
				Logger: svcLogger,
				Storage: store,
			})

			grpcServer := grpc.NewServer(
				grpc.ChainUnaryInterceptor(
					methodLoggingInterceptor(svcLogger),
				),
			)

			pb.RegisterUserServiceServer(grpcServer, service)
			pb.RegisterDrinkServiceServer(grpcServer, service)
			reflection.Register(grpcServer)

			port := ":" + viper.GetString(config.GRPCPort)
			lis, err := net.Listen("tcp", port)
			if err != nil {
				logger.Err(err).Msg("error starting listener")
				return err
			}

			logger.Info().Str("port", port).Msg("starting server")
			if err := grpcServer.Serve(lis); err != nil {
				logger.Err(err).Msg("error serving gRPC")
				return err
			}

			return nil
		},
	}

	root.AddCommand(
		Migrate(),
	)

	return root
}

func methodLoggingInterceptor(logger zerolog.Logger) grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
		logger.Info().Str("path", info.FullMethod).Msg("request recieved")
		return handler(ctx, req)
	}
}

func grpcHandlerFunc(grpcServer *grpc.Server, otherHandler http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.ProtoMajor == 2 && strings.Contains(r.Header.Get("Content-Type"), "application/grpc") {
			grpcServer.ServeHTTP(w, r)
		} else {
			otherHandler.ServeHTTP(w, r)
		}
	})
}
