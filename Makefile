#.PHONY: help certs up down logs

include .env

## Show help
RESET=\x1b[0m
GREEN=\x1b[32;01m
RED=\x1b[31;01m
YELLOW=\x1b[33;01m

default: up

## help : Print this help.
.PHONY: help

help : Makefile
	@sed -n 's/^##//p' $<

## certs:	generate SSL certificates
.PHONY: certs
certs:
	@echo -e "${GREEN}Generating SSL certificates...${RESET}"
	@./ssl/create-certs.sh

## up:	start Docker containers
.PHONY: up
up: certs
	@echo -e "${GREEN}Starting up Docker containers...${RESET}"
	@docker compose pull
	@docker compose up -d --build

## down:	stop Docker containers'
.PHONY: down
down:
	@echo -e "${GREEN}Stopping Docker containers...${RESET}"
	@docker compose down

## down:	view Docker container logs'
.PHONY: down
logs:
	@echo -e "${GREEN}Showing Docker container logs...${RESET}"
	docker compose logs -f
