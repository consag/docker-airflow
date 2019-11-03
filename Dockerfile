# VERSION 0.0.1 
# AUTHOR: Jac. "Tools" Beekers
# DESCRIPTION: Basic Airflow with Informatica command line utilities
# BUILD: docker build --rm -t jactools/docker-aiflow-scheduler .
# SOURCE: https://github.com/consag/docker-airflow-informatica
# BASED ON: https://github.com/puckel/docker-airflow

FROM puckel/docker-airflow
LABEL maintainer="JacTools"

USER root
COPY script/infacmd.sh /appl/informatica/current/server/bin/
COPY dags dags
COPY requirements.txt /requirements.txt
RUN set -ex \
    && pip install -r /requirements.txt 


