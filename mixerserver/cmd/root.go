package cmd

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/nicjohnson145/mixer/mixerserver/config"
	"github.com/nicjohnson145/mixer/mixerserver/internal/service"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
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

			store := storage.NewPostgresStore(storage.PostgresStoreConfig{
				Logger: config.WithComponent(logger, "storage"),
				DB: db,
			})

			service := service.NewHTTPService(service.HTTPServiceConfig{
				Logger: config.WithComponent(logger, "httpservice"),
				Storage: store,
			})

			router := chi.NewRouter()
			service.RegisterRoutes(router)

			port := fmt.Sprint(viper.GetInt(config.Port))
			logger.Info().Str("port", port).Msg("starting http listener")
			if err := http.ListenAndServe(":" + port, router); err != nil {
				logger.Err(err).Msg("error starting HTTP server")
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
