# Copyright (c) 2018 Red Panda CI Project
#
# Docker CentOS: Base + httpd
#

FROM redpandaci/docker-centos:base

RUN touch /var/lib/rpm/* && \
    yum install -y httpd && \
    yum clean all
