# Copyright (c) 2018 The KairOps Project
#
# Docker CentOS: Java + Redis
#

FROM kairops/docker-centos:java

RUN touch /var/lib/rpm/* && \
    yum install -y epel-release && \
    yum update -y

RUN yum install -y redis && \
    yum clean all
