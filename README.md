# Tatooine Environment Setup

This repository contains the Docker environment setup for the Tatooine project. Follow the instructions below to clone the necessary repositories and build the environment.

## Prerequisites

Make sure you have the following installed on your machine:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

## Setup Instructions ##

## Clone this repository to your local machine:
   
   git clone https://github.com/tico087/tatooine.git
   cd tatooine
Run the setup script to clone the necessary repositories and build the Docker environment:
bash

./setup_environment.sh
setup_environment.sh
This script will:

Check if the modular-env-v1 directory exists,if not, it will create it.
Clone the required repositories into the modular-env-v1 directory.
Build and start the Docker containers.

## Content of setup_environment.sh:

#!/bin/bash
if [ ! -d "modular-env-v1" ]; then
    mkdir modular-env-v1
fi


cd modular-env-v1

# Clone the required repositories
git clone https://github.com/tico087/mariadb.git
git clone https://github.com/tico087/nginx.git
git clone https://github.com/tico087/node.git
git clone https://github.com/tico087/vue.git
git clone https://github.com/tico087/laravel.git

cd ..

# Run the Docker setup script
./run_docker.sh
run_docker.sh
This script will:

Bring down any running Docker containers and remove orphans.
Build and start the specified Docker services.

## Content of run_docker.sh:

#!/bin/bash

if [ "$#" -eq 0 ]; then
    services="mariadb node nginx vue-node vue-laravel laravel"
else
    services="$@"
fi

docker compose down --remove-orphans
docker compose up -d --build $services
Usage
To start the Docker environment:



./run_docker.sh
To stop the Docker environment:

docker compose down

## Troubleshooting
If you encounter any issues, make sure that Docker is running and you have the necessary permissions to execute the scripts. For further assistance, check the Docker and Git documentation or reach out to the repository maintainers.

Contributing
If you wish to contribute to this project, please fork the repository and create a pull request with your changes.


This `README.md` provides clear instructions on how to set up and run the Tatooine environme