

# Smallest base image
FROM archlinux:latest

LABEL maintainer="Zeaq <m dot pichlo at gmx dot de>"

RUN pacman -Syu iptables iproute2 git && wget https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables.sh
