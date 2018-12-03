# Copyright (c) 2018 The KairOps Project
#
# Docker CentOS: Java + Ansible, prepared to install Jenkins
#

FROM kairops/docker-centos:java

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
