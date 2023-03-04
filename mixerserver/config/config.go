package config

import (
	"strings"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

const (
	GatewayPort = "gateway.port"
	GRPCPort    = "grpc.port"

	Debug = "debug"

	DatabaseHost     = "database-host"
	DatabasePort     = "database-port"
	DatabaseUsername = "database-username"
	DatabasePassword = "database-password"
	DatabaseName     = "database-name"
)

func InitializeConfig(cmd *cobra.Command) error {
	viper.SetDefault(GatewayPort, 8080)
	viper.SetDefault(GRPCPort, 50051)

	viper.SetDefault(Debug, false)

	viper.SetDefault(DatabaseName, "mixer")
	viper.SetDefault(DatabaseHost, "localhost")
	viper.SetDefault(DatabasePort, 5432)
	viper.SetDefault(DatabaseUsername, "mixer_usr")
	viper.SetDefault(DatabasePassword, "mixer_pass")

	viper.AutomaticEnv()
	viper.SetEnvKeyReplacer(strings.NewReplacer("-", "_"))
	viper.BindPFlags(cmd.Flags())

	return nil
}
