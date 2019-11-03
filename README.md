# docker-airflow-informatica
[![CircleCI](https://circleci.com/gh/jactools/docker-airflow-informatica/tree/master.svg?style=svg)](https://circleci.com/gh/jactools/docker-airflow-informatica/tree/master)
[![Docker Build Status](https://img.shields.io/docker/build/jactools/docker-airflow-informatica.svg)]()

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://hub.docker.com/r/jactools/docker-airflow-informatica/)
[![Docker Pulls](https://img.shields.io/docker/pulls/jactools/docker-airflow-informatica.svg)]()
[![Docker Stars](https://img.shields.io/docker/stars/jactools/docker-airflow-informatica.svg)]()

This repository contains **Dockerfile** of [apache-airflow](https://github.com/apache/incubator-airflow) based on [puckel/docker-airflow](https://hub.docker.com/r/puckel/docker-airflow)'s image.

## Information

* Based on puckel/docker-airflow 
* Install [Docker](https://www.docker.com/)
* Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

## Installation

Pull the image from the Docker repository.

    docker pull jactools/docker-airflow-informatica

## Build

    docker build -t jactools/docker-airflow-informatica .

## Usage

Please check the usage note at [puckel/docker-airflow](https://github.com/puckel/docker-airflow)

For example:
    docker run -d --name airflow -p 8080:8080 jactools/docker-airflow-informatica webserver

To stop the container:
    docker stop airflow

To remove it (before you can start it again)
    docker rm airflow

## UI Links

- Airflow: [localhost:8080](http://localhost:8080/)
- Flower: [localhost:5555](http://localhost:5555/)


## Running other airflow commands

If you want to run other airflow sub-commands, such as `list_dags` or `clear` you can do so like this:

    docker run --rm -ti puckel/docker-airflow airflow list_dags

You can also use this to run a bash shell or any other command in the same environment that airflow would be run in:

    docker run --rm -ti puckel/docker-airflow bash
    docker run --rm -ti puckel/docker-airflow ipython

# Wanna help?

Fork, improve and PR. ;-)
