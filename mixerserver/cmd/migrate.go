package cmd

import (
	"github.com/nicjohnson145/mixer/mixerserver/config"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	"github.com/spf13/cobra"
)

func Migrate() *cobra.Command {
	root := &cobra.Command{
		Use:   "migrate",
		Short: "Execute DB migrations",
		RunE: func(cmd *cobra.Command, args []string) error {
			logger := config.InitLogger()

			db, err := connectDB()
			if err != nil {
				logger.Err(err).Msg("connecting to DB")
				return err
			}
			defer db.Close()

			logger.Info().Msg("executing migrations")
			err = storage.Migrate(db)
			if err != nil {
				logger.Err(err).Msg("error migrating")
				return err
			}

			return nil
		},
	}
	root.Flags().String(config.DatabaseHost, "", "Hostname of DB")
	root.Flags().Int(config.DatabasePort, 0, "Port of DB")
	root.Flags().String(config.DatabaseUsername, "", "Username of DB")
	root.Flags().String(config.DatabasePassword, "", "Password of DB")
	root.Flags().String(config.DatabaseName, "", "Name of DB")

	return root
}
