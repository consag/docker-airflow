# docker-airflow-informatica
[![Docker Build Status](https://img.shields.io/docker/cloud/build/jactools/docker-airflow-informatica.svg)]()

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
### without Informatica command line utilities

    docker build -t jactools/docker-airflow-informatica:no_infa .
    
### with Informatica command line utilities
    Copy the extracted Informatica command line utilities directory into software/, so the directory structure looks like this (for Informatica 10.2.2)
    software/informatica
    software/informatica/PowerCenter
    software/informatica/shared
    ...
    
    then:
    docker build -t jactools/docker-airflow-informatica:infa1022 .
    
## Usage

Please check the usage note at [puckel/docker-airflow](https://github.com/puckel/docker-airflow)

For example:
    docker run -d --name airflow -p 8080:8080 jactools/docker-airflow-informatica webserver

To stop/start the container:
    docker stop airflow
    docker start airflow

To remove it
    docker rm airflow

## Run postgres with airflow in two docker containers using docker-compose 
Without installed Informatica command line utilities:
    docker-compose docker-compose-LocalExecutor-noinfa.yml up
With 10.2.2 installed Informatica command line utilities:
    docker-compose docker-compose-LocalExecutor-infa1022.yml up

## UI Links

- Airflow: [localhost:8080](http://localhost:8080/)
- Flower: [localhost:5555](http://localhost:5555/)


## Running other airflow commands

If you want to run other airflow sub-commands, such as `list_dags` or `clear` you can do so like this:

    docker run --rm -ti puckel/docker-airflow-informatica airflow list_dags

You can also use this to run a bash shell or any other command in the same environment that airflow would be run in:

    docker run --rm -ti puckel/docker-airflow-informatica bash
    docker run --rm -ti puckel/docker-airflow-informatica ipython

# Wanna help?

Fork, improve and PR. ;-)
