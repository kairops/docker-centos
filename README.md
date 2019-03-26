# Docker CentOS

A series of docker CentOS based images acting as a bunch of base images that you can use to build your own working docker image set.

The idea is to use these images as a starting point to build your own images adding static files, configurations and so on and push the result to your private repositorie.

The base image starts `sshd` as a servixce

Workflow:

- Get the docker-centos image set

```console
$ docker pull kairops/docker-centos:base
$ docker pull kairops/docker-centos:httpd
$ docker pull kairops/docker-centos:java
$ docker pull kairops/docker-centos:jenkins
$ docker pull kairops/docker-centos:systemd
```

- Build your own images as _cattle_ or _pets_
  - If you want to have a cattle, use Dockerfile + build + push

```dockerfile
FROM kairops/docker-centos:httpd

RUN touch /var/lib/rpm/* && \
    yum install -y pyton && \
    yum install -y python-pip && \ 
    yum clean all

COPY start.py /tmp/configure.py
RUN /tmp/configure.py

# ... and more things at your own choice

```

  - If you want _pets_
    - Start a container in deatached mode `docker run -d --name temp-source-httpd kairops/docker-centos:httpd` (the sshd daemon starts here)
    - Access to the running container with `docker exec -ti docker-centos-httpd /bin/bash` and make changes
    - Stop the container with `docker stop temp-source-httpd docker-centos-httpd`
    - Push the container to your repository `docker push docker-centos-httpd myprivaterepository/docker-centos:httpd-custom`

