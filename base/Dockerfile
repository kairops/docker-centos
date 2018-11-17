# Copyright (c) 2018 Red Panda CI Project
#
# Docker CentOS: Base with sshd running by default
#

FROM centos:6.7

# command line goodies
RUN echo "export LANG=en_GB.utf8" >> /etc/profile && \
    echo "alias ll='ls -l --color=auto'" >> /etc/profile && \
    echo "alias grep='grep --color=auto'" >> /etc/profile

# telnet is required by some fabric command. without it you have silent failures
RUN touch /var/lib/rpm/* && \
    yum -y groupinstall "Base" && \ 
    yum -y install openssh-server sudo git libselinux-python ca-certificates && \
    yum clean all

# enable no pass and speed up authentication
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/;s/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config && \
    echo -e "Host *\n\tControlMaster auto\n\tControlPath  ~/.ssh/sockets/%r@%h-%p\n\tControlPersist 600" >> /etc/ssh/ssh_config && \
    mkdir -p /root/.ssh/sockets

# enabling sudo group
RUN echo -e "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# enabling sudo over ssh
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

CMD service sshd start ; bash

# declaring exposed ports. helpful for non Linux hosts. add "-P" flag to your "docker run" command to automatically expose them and "docker ps" to discover them.
# SSH
EXPOSE 22
