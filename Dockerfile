FROM ubuntu:22.04 as base

ENV UBUNTU_CODENAME=jammy

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \
    lsb-release \
    sudo \
    wget \
    gpg \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | tee /etc/apt/sources.list.d/ansible.list
RUN apt update

