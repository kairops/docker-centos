# Copyright (c) 2018 The KairOps Project
#
# Docker CentOS: Base + httpd
#

FROM kairops/docker-centos:base

RUN touch /var/lib/rpm/* && \
    yum install -y epel-release && \
    yum update -y

RUN yum install -y redis && \
    yum clean all