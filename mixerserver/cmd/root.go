package cmd

import (
	"fmt"
	"time"

	"github.com/nicjohnson145/mixer/mixerserver/config"
	"github.com/spf13/cobra"
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
			for {
				fmt.Println("hello world")
				time.Sleep(5 * time.Second)
			}
			return nil
		},
	}

	root.AddCommand(
		Migrate(),
	)

	return root
}
