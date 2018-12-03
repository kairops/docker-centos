# Copyright (c) 2018 The KairOps Project
#
# Docker CentOS: Base + Java
#

FROM kairops/docker-centos:base

RUN touch /var/lib/rpm/* && \
    yum install -y epel-release && \
    yum install -y python-pip PyYAML python-crypto python-httplib2 python-jinja2-26 python-keyczar python-paramiko python-setuptools python-simplejson python-six sshpass yum install -y python-crypto2.6 python2-jmespath && \ 
    yum install -y java-1.6-0-openjdk-devel java-1.6.0-openjdk-headless java-1.6.0-openjdk && \
    yum install -y java-1.7-0-openjdk-devel java-1.7.0-openjdk-headless java-1.7.0-openjdk && \
    yum install -y java-1.8-0-openjdk-devel java-1.8.0-openjdk-headless java-1.8.0-openjdk && \
    yum clean all
