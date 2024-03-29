#! /bin/bash

touch "$projectDirectory/main.go"

cat <<EOL > "$projectDirectory/main.go"
  package main

  import (
    "log"

    "github.com/gorilla/mux"
    "github.com/joho/godotenv"
    "github.com/$name"

  )

  func main() {

    err := godotenv.Load(".env")

    if err != nil {
      log.Fatal("Error", err)
    }

    s, err := server.NewServer(context.Background(), &server.Config{
      Port:        os.Getenv("PORT"),
      JWTSecret:   os.Getenv("JWT_SECRET"),
      DatabaseUrl: os.Getenv("DATABASE_URL"),
	  })

    if err != nil {
      log.Fatal(err)
    }

	  s.Start(BindRoutes)

  }

  func BindRoutes(s server.Server, r *mux.Router) {
    
  }

EOL