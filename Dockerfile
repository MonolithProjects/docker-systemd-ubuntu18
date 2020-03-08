FROM ubuntu:18.04
LABEL maintainer="Michal Muransky"
ENV \
    container=docker \
	MY_USER=ansible \
	MY_GROUP=ansible \
	MY_UID=1000 \
	MY_GID=1000

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       locales \
       python-setuptools \
       python-pip \
       software-properties-common \
       rsyslog systemd systemd-cron sudo iproute2 \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN set -eux \
	&& groupadd -g ${MY_GID} ${MY_GROUP} \
	&& useradd -m -d /home/ansible -s /bin/bash -G ${MY_GROUP} -g ${MY_GID} -u ${MY_UID} ${MY_USER} \
    && echo "%${MY_USER}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers \
	\
	&& mkdir /home/ansible/.gnupg \
	&& chown ansible:ansible /home/ansible/.gnupg \
	&& chmod 0700 /home/ansible/.gnupg \
	\
	&& mkdir /home/ansible/.ssh \
	&& chown ansible:ansible /home/ansible/.ssh \
	&& chmod 0700 /home/ansible/.ssh 

RUN locale-gen en_US.UTF-8

RUN mkdir -p /etc/ansible
# hadolint ignore=SC2039
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
