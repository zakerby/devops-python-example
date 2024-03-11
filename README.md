# Django Project Template

Django project template with a lot of basic project must-have features, such as containerization and deployments to GCR, ECR, Dockerhub and regular old VM using Github Actions. Also Unit Test, Code Coverage, Static Analysis and Stages Flow (such as dev, staging, uat and production) are  part of this project template repository.

## What is Inside This Template?

## Development Stage

### Requirements

1. Python >= 3.8.5
2. Pip >= 21.0.1

### Installing Dependencies

`pip install -r requirements.txt`

### Setting Up Environment Variables

`source envvars`

### Creating Container for Database Server

To start new database server, run this command:

`docker-compose up -d`

Check if database running __correctly__ by accessing database from command line or PGAdmin.

### Migrating Database

To create migration scripts:

`python manage.py makemigrations app`

To execute migrations:

`python manage.py migrate app`

### Running The Application

`python manage.py runserver 0.0.0.0:8080`

### Running Test Suite

This application using [pytest](https://pypi.org/project/pytest/) as the test framework and [pytest-django](https://pypi.org/project/pytest-django/) as integration tool with Django Framework. To run unit test simply run this command.

`pytest -s`

### Running Code Coverage

This application using [coverage](https://pypi.org/project/coverage/) as the code coverage tool and [pytest-cov](https://pypi.org/project/pytest-cov/) as integration tools with Pytest. To run code coverage simply run this command.

`pytest --cov-report html --cov-report term --cov=app app/tests/`

### Running Static Analysis

To run static analysis using flake8, run this command:

`flake8 --config=.flake8 --count --statistics app/ core/`

## Continues Integration

You can use __build-ci__ status checks in the repository settings to ensure continues integration is working correctly on target branch. This status checks come from __.github/workflows/onpush-ci.yml__.

## Deployment Stage

This project template provide deployment using docker image. The deployment targets are GCR, ECR, Dockerhub or VM, you can see the workflows from this these files __.github/workflows/*-deployment.yml__.

### Build Image

To build image run this command (__change the tag name & version with your preferred tag name & version__).

`$ docker build . -t myorganization/myimage:1.0.0`

### Running Container from Image

To create a container from the image, run this command (__change the tag name & version with your preferred tag name & version__).

`$ docker run -d -p 8000:8000 --network=serviceNetwork --name django-app myorganization/myimage:1.0.0`

Then you can access the app from the browser with this url: `http://127.0.0.1:8000`

### Dockerhub image

This repository is proven by running build in Dockerhub, you can see the result [here](https://hub.docker.com/r/namikazebadri/django-app).
