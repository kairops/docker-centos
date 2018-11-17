# Copyright (c) 2018 Red Panda CI Project
#
# Docker CentOS: Base + Ansible, prepared to install Jenkins
#

FROM redpandaci/docker-centos:base

RUN touch /var/lib/rpm/* && \
    yum install -y epel-release && \
    yum install -y python-pip PyYAML python-crypto python-httplib2 python-jinja2-26 python-keyczar python-paramiko python-setuptools python-simplejson python-six sshpass yum install -y python-crypto2.6 python2-jmespath && \ 
    yum install -y java-1.6-0-openjdk-devel java-1.6.0-openjdk-headless java-1.6.0-openjdk && \
    yum install -y java-1.7-0-openjdk-devel java-1.7.0-openjdk-headless java-1.7.0-openjdk && \
    yum install -y java-1.8-0-openjdk-devel java-1.8.0-openjdk-headless java-1.8.0-openjdk && \
    yum clean all

# add a user for the application, with sudo permissions
RUN echo "jenkins ALL=(ALL) ALL" >> /etc/sudoers.d/jenkins
RUN useradd -m jenkins ; echo jenkins:jenkins | chpasswd ; usermod -a -G wheel jenkins

# assigning higher default ulimits
# unluckily this is not very portable. these values work only if the user running docker daemon on the host has his own limits >= than values set here
# if they are not, the risk is that the "su fuse" operation will fail
RUN echo "jenkins                -       nproc            4096" >> /etc/security/limits.conf
RUN echo "jenkins                -       nofile           4096" >> /etc/security/limits.conf

# disable strict host checking to avoid any manual step
RUN mkdir -p /home/jenkins/.ssh/sockets ; printf "Host * \nUserKnownHostsFile /dev/null \nStrictHostKeyChecking no" >> /home/jenkins/.ssh/config ; chown -R jenkins:jenkins /home/jenkins
