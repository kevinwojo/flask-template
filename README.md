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
 3. Run `make monitor` to monitor the status and read log information. You can use `Ctrl + C` to exit the logs.
 4. The Flask application will run at http://localhost:5000.
 5. Prometheus will run at http://localhost:9090.
 6. Grafana will run at http://localhost:3000.
 7. When finished, run `make down` to stop all containers.

## Features
There is a lot of functionality that is assumed when cloning this repository.
These sections provide more details about the components so that you can hit the ground running.

### Makefile
This project makes use of a `Makefile`. This is used to capture complex build steps in order to make 
the build-test process consistent between local development, the Dockerfile, and the CI pipeline.

The Makefile should call external scripts where necessary, at this time the `build-scripts/` directory is
the designated area for these files.

### Continuous Integration (CI) Pipeline
Where possible, the CI pipeline that is implemented should make use of the make commands.
Generally-speaking the process should the following flow:

 1. Build: `make build`
 2. Test: `make test`
 3. @TODO - Needs implemented - Release: `make release`

## Continuous Deployment
TBD

### Trunk-Based Branching
The automation in this repository favors a [trunk-based branching strategy](https://trunkbaseddevelopment.com/).
This strategy reduces the need for complex automation to deal with the overhead introduced by other branching techniques
and lends itself to immutable and fully-tested builds.

### Dockerfile
The Dockerfile in this repository is structured to attempt to make good use of [build caching](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#leverage-build-cache). The ordering of the `RUN` and `COPY` directives
should encourage the reuse layers.

A non-root application user called "appuser" is added to an "appgroup". This helps promote a better security posture
and mitigate against jailbreak attacks. This is considered [best practice by Docker](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user).

### Docker Compose

### Grafana
TBD

### Gunicorn
[Flask's built-in server is not suitable for production.](https://flask.palletsprojects.com/en/1.1.x/deploying/). This 
template implements Gunicorn as the WSGI server with 4 workers. Depending on your needs you may need to increase the 
number of worker processes.

For information on why the built-in server is not suitable for production, [review this answer on StackOverflow.](https://stackoverflow.com/a/20862119)


### Semantic Versioning
This repository implements [Semantic Versioning 2.0.0](https://semver.org/). This allows for 
the service to make use of a meaningful artifact-based deployment. This gives confidence that the correct
revision of software is deployed into an environment and improves the posture in terms of roll-back.

### Prometheus
[Prometheus](https://prometheus.io/) is an open-source, time-series-based, monitoring solution. There is a large
community around the Prometheus ecosystem. Since Prometheus provides a generic interface, it can be used to 
monitor infrastructure as well as applications. It is generally paired with Grafana to provide rich visualizations.

Review Prometheus' [best practices](https://prometheus.io/docs/practices/naming/) before you implement custom metrics.

### Prometheus Python Exporter
The Flask application imports [prometheus-flask-exporter](https://pypi.org/project/prometheus-flask-exporter/)
to instrument all Flask endpoints for Prometheus' consumption. This implements the [official Prometheus Python client](https://github.com/prometheus/client_python) and has a convenient wrapper around the [Gunicorn interface](https://github.com/prometheus/client_python#multiprocess-mode-gunicorn).
