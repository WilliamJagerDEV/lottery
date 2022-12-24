#!make
include .env

build:
	DOCKER_BUILDKIT=1 COMPOSE_DOCKER_CLI_BUILD=1 \
	docker-compose build \
	--no-cache \
	--ssh default

start:
	docker compose up -d --no-recreate

remove:
	docker compose stop && docker-compose rm -f

recreate:
	make build && docker compose up --force-recreate -d

exec:
	docker exec -it lottery bash

mix_deps:
	docker compose run --rm -v ~/.ssh:/root/.ssh lottery mix deps.get

setup:
	make build && make mix_deps && make start

ecto_setup:
	docker compose run --rm lottery mix ecto.setup

ecto_migrate:
	docker compose run --rm lottery mix ecto.migrate

ecto_gen_migration:
	docker compose run --rm lottery sh -c "mix ecto.gen.migration $(name)"

ecto_seed:
	docker compose run --rm lottery mix run priv/repo/seeds.exs

logs:
	docker compose logs -f $(services)

restart:
	make remove && make start
