#! /bin/bash

mkdir -p "$projectDirectory/database"

touch "$projectDirectory/database/database.go"
touch "$projectDirectory/database/up.sql"

cat <<EOL > "$projectDirectory/database/database.go"
package database

import (
	"database/sql"

	_ "github.com/lib/pq"
)

type PostgresRespository struct {
	db *sql.DB
}

func NewPostgresRespository(url string) (*PostgresRespository, error) {
	db, err := sql.Open("postgres", url)
	if err != nil {
		return nil, err
	}
	return &PostgresRespository{db}, nil
}
EOL