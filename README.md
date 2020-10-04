# Flask Template
This is an opinionated template for a Flask application. This should be used as a starting point for a 
production-ready Flask app.

## Placeholder for Service Information
TBD

## Development Manual
This repository assumes that you have some prerequisites that are outside the scope of this project.
 * [Docker](https://docs.docker.com/get-docker/)
 * [Docker Compose](https://docs.docker.com/compose/install/)

 1. Clone this repository: `git clone git@github.com:kevinwojo/flask-template.git`
 2. Run `make up` to build and start the project within Docker Compose.
 3. Run `make monitor` to monitor the status and read log information.
 4. The Flask application will run at http://localhost:5000.
 5. Prometheus will run at http://localhost:9090.
 6. Grafana will run at http://localhost:3000.
 7. When finished, run `make down` to stop all containers.

## Features
There is a lot of functionality that is assumed when cloning this repository.
These sections provide more details about the components so that you can hit the ground running.

### CI Pipeline

### Semantic Versioning

### Makefile

### Dockerfile

### Docker Compose

### Prometheus

### Prometheus Python Exporter

### Grafana
