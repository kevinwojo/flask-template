DOCKER_REPO = "docker.kwojo314.com"
PROJECT_NAME = $(notdir $(PWD))

#
# Local development
#
venv:
	python -m venv venv

up : docker-compose.yml
	docker-compose up -d --build

down: docker-compose.yml
	docker-compose down

monitor: docker-compose.yml
	docker-compose logs -f

login:
	docker exec -it $(shell echo $(PROJECT_NAME) | tr -d -)_api_1 /bin/sh

#
# Build & Test
#
build : requirements.txt
	pip install -r requirements.txt

test:
	pytest

#
# Release
#
minor-release: version.txt
	$(info MINOR is $(MINOR))


#
# Packaging
#
docker : Dockerfile
	docker build -t $(DOCKER_REPO)/$(PROJECT_NAME):$(VERSION) .

deploy : docker
	docker push $(DOCKER_REPO)/$(PROJECT_NAME):$(VERSION)
