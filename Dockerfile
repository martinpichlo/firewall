FROM base/archlinux

LABEL maintainer="Zeaq"

ADD bin /usr/local/bin

RUN pacman -Syu --noconfirm iptables && \
    chmod u+x /usr/local/bin/*.sh

ENTRYPOINT ["start.sh"]

