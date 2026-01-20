.PHONY: build run test lint

build:
	docker build -t svsa-monolith:local .

run:
	docker-compose up --build

test:
	pytest -q

lint:
	flake8 src
