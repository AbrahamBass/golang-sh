#! /bin/bash

mkdir -p "$projectDirectory/repository"

touch "$projectDirectory/repository/repository.go"

cat <<EOL > "$projectDirectory/repository/repository.go"
package repository

type Repository interface {}

var implementations Repository

func SetRepository(repository Repository) {
	implementations = repository
}
EOL