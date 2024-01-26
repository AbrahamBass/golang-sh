#!/bin/bash

echo "¡Bienvenido!"
echo "El proyecto se creará en esta carpeta: $PWD"

read -p "¿Desea continuar? (y/n): " permissions

while [ "$permissions" != "y" ]
do
  if [ "$permissions" = "n" ]; then
    echo "Saliendo del programa..."
    exit 1
  else
    echo "Caracter no válido..."
    read -p "(y/n):" permissions  
  fi
done

read -p "Ingresa el nombre del proyecto: " name

export name

projectDirectory="$PWD/$name"  # Utiliza PWD para obtener la ruta actual

export projectDirectory

mkdir -p "$projectDirectory"

./init.sh
./server.sh
./repository.sh
./database.sh

cd "$projectDirectory"

echo "Inicializando el proyecto..."
go mod init "github.com/$name"
go get -u

echo "Configurando el gitignore..."
touch "$projectDirectory/.gitignore"

echo "Configurando las variables de entorno..."
touch "$projectDirectory/.env"

cat <<EOL > "$projectDirectory/.env"
PORT=:8080
DATABASE_URL=
JWT_SECRET=
EOL

echo "Instalando gorrilla mux..."
go get -u github.com/gorilla/mux

echo "Instalando godotenv..."
go get -u github.com/joho/godotenv

echo "Instalando controlador de postgreSQL..."
go get -u github.com/lib/pq

echo "Instalando cors..."
go get -u github.com/rs/cors

echo "-----!Proyecto Creado!-----"



