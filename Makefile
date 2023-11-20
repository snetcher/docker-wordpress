# Makefile
.PHONY: setup certs up down

# Default action is to start up the project
default: up

# Setup the application
setup: certs

# Generate SSL certificates
certs:
	@echo "Generating SSL certificates..."
	@./ssl/create-certs.sh

# Start up the docker-compose project
up: setup
	@echo "Starting up containers..."
	@docker-compose up -d --build

# Stop the docker-compose project
down:
	@echo "Stopping containers..."
	@docker-compose down

# If you'd like to add more utility rules, you can do so below