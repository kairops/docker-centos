#!/bin/bash
cd "$(dirname $0)/.."

docker build -t kairops/docker-centos:base       base
docker build -t kairops/docker-centos:httpd      httpd
docker build -t kairops/docker-centos:java       java
docker build -t kairops/docker-centos:jenkins    jenkins
docker build -t kairops/docker-centos:systemd    systemd
docker build -t kairops/docker-centos:redis      redis
