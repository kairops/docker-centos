# Copyright (c) 2018 The KairOps Project
#
# Docker CentOS: Base + httpd
#

FROM kairops/docker-centos:base

RUN touch /var/lib/rpm/* && \
    yum install -y httpd mod_ssl && \
    yum clean all

RUN groupadd httpdgrp && useradd -m httpdusr -g httpdgrp
