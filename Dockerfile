# VERSION 0.0.1 
# AUTHOR: Jac. "Tools" Beekers
# DESCRIPTION: Airflow with Informatica command line utilities on Centos
# BUILD: docker build --rm -t jactools/docker-aiflow-scheduler .
# SOURCE: https://github.com/consag/docker-airflow-informatica
# BASED ON: https://github.com/puckel/docker-airflow

FROM centos:7.5.1804 
LABEL maintainer="JacTools"

## Informatica

# copy installers
#COPY script/infacmd.sh /appl/informatica/current/server/bin/
#COPY software/shared/ /infacmd/shared/
#COPY software/PowerCenter /infacmd/PowerCenter

## Airflow
# roughly copied from puckel/docker-airflow
# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Airflow
ARG AIRFLOW_VERSION=1.10.4
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ARG AIRFLOW_DEPS=""
ARG PYTHON_DEPS=""
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

# Python
ARG PYTHON_VERSION=3.7.4

# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

##
# For now in multiple layers
# TODO: Merge into one layer
RUN set -ex \
    && buildDeps='\
        freetds-devel \
        cyrus-sasl \
        cyrus-sasl-devel \
        krb5-libs \
        openssl-devel \
        libffi-devel \
        postgresql-devel \
        git \
    ' \
    && yum install -y epel-release \
    && yum update --nogpgcheck -y -q \
    && yum upgrade --nogpgcheck -y -q \
    && yum install -y \
       $buildDeps

RUN set -ex \
    && yum install -y -q \
       freetds-bin \
       build-essential \
       default-libmysqlclient-dev \
        apt-utils \
        gcc \
        openssl-devel \
        bzip2-devel \
        libffi-devel \
        curl \
        rsync \
        netcat \
        locales \
        wget

# centos docker does not include localedef, need it.
RUN set -ex \
    && yum -y -q reinstall glibc-common \
    && localedef -c -i en_US -f UTF-8 en_US.UTF-8

RUN set -ex \
    && useradd -G wheel -s /bin/bash -md ${AIRFLOW_USER_HOME} airflow 

RUN set -ex \
    && yum -y -q install make

RUN set -ex \
    && wget -q https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz \
    && tar -xzf Python*tgz \
    && cd Python-* \
    && mkdir -p /appl/python \
    && ./configure --prefix /appl/python/$PYTHON_VERSION --enable-optimizations 2>/dev/null >/dev/null \
    && make install >/dev/null \
    && cd /appl/python \
    && ln -s $PYTHON_VERSION current \
    && ls -l /appl/python/current/bin/

ENV PATH=/appl/python/current/bin:$PATH

RUN set -ex \
    && cd /appl/python/current/bin \
    && ln -s python3 python \
    && ln -s pip3 pip \
    && python --version \
    && pip install --upgrade pip
    
## additional requirements like Informatica's plugin for Airflow
USER root
COPY requirements.txt /requirements.txt
RUN set -ex \
    && pip install -r /requirements.txt 

