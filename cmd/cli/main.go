package main

import (
	"log"

	"github.com/joho/godotenv"
	"github.com/spf13/cobra"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	rootCmd := cobra.Command{
		Use:   "4me",
		Short: "4me CLI Task Managment",
	}

	if err := rootCmd.Execute(); err != nil {
		log.Fatal(err)
	}
}
