

FROM base/archlinux

LABEL maintainer="Zeaq <m dot pichlo at gmx dot de>"

RUN pacman -Syu --noconfirm iptables iproute2 wget && wget -q --no-check-certificate https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables.sh
