package cmd

import (
	"context"
	"fmt"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"github.com/nicjohnson145/mixer/mixerserver/config"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func Gateway() *cobra.Command {
	root := &cobra.Command{
		Use:   "gateway",
		Short: "Start grpc gateway proxy",
		RunE: func(cmd *cobra.Command, args []string) error {
			logger := config.InitLogger()

			ctx, cancel := context.WithCancel(context.Background())
			defer cancel()

			mux := runtime.NewServeMux()
			opts := []grpc.DialOption{grpc.WithTransportCredentials(insecure.NewCredentials())}

			grpcEndpoint := fmt.Sprintf("%v:%d", viper.GetString(config.GatewayGRPCHost), viper.GetInt(config.GRPCPort))
			err := pb.RegisterDrinkServiceHandlerFromEndpoint(ctx, mux, grpcEndpoint, opts)
			if err != nil {
				logger.Err(err).Msg("error registering drink service gateway")
				return err
			}

			err = pb.RegisterUserServiceHandlerFromEndpoint(ctx, mux, grpcEndpoint, opts)
			if err != nil {
				logger.Err(err).Msg("error registering user service gateway")
				return err
			}

			gatewayEndpoint := fmt.Sprintf(":%d", viper.GetInt(config.GatewayPort))
			logger.Info().Str("addr", gatewayEndpoint).Msg("starting gateway")
			return http.ListenAndServe(gatewayEndpoint, mux)
		},
	}

	return root
}
