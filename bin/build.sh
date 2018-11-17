#!/bin/bash
cd "$(dirname $0)/.."

docker build -t redpandaci/docker-centos:base       base
docker build -t redpandaci/docker-centos:httpd      httpd
docker build -t redpandaci/docker-centos:jenkins    jenkins
