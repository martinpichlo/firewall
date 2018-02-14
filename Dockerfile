FROM base/archlinux

LABEL maintainer="Zeaq"

ADD bin /usr/local/bin

COPY start.sh \
     iptables_up.sh \
     iptables_down.sh \ 
     iptables_own.sh \
     /usr/local/bin

RUN pacman -Syu --noconfirm iptables iproute2 && \
    chmod u+x /usr/local/bin/*.sh

ENTRYPOINT ["/root/start.sh"]

