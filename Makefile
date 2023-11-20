.PHONY: help certs up down logs

## Show help
RESET=\x1b[0m
GREEN=\x1b[32;01m
RED=\x1b[31;01m
YELLOW=\x1b[33;01m

default: up

help:
	@echo -e "${GREEN}\nAvailable commands:${RESET}"
	@echo -e '  ${YELLOW}help${RESET} - You are here'
	@echo -e '  ${YELLOW}certs${RESET} - generate SSL certificates'
	@echo -e '  ${YELLOW}up${RESET} - start Docker containers'
	@echo -e '  ${YELLOW}down${RESET} - stop Docker containers'
	@echo -e '  ${YELLOW}logs${RESET} - view Docker container logs'

certs:
	@echo -e "${GREEN}Generating SSL certificates...${RESET}"
	@./ssl/create-certs.sh

up:
	@echo -e "${GREEN}Starting up Docker containers...${RESET}"
	@docker-compose up -d --build

down:
	@echo -e "${GREEN}Stopping Docker containers...${RESET}"
	@docker-compose down

logs:
	@echo -e "${GREEN}Showing Docker container logs...${RESET}"
	docker-compose logs -f