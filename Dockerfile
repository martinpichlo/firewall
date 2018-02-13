FROM base/archlinux

LABEL maintainer="Zeaq <m dot pichlo at gmx dot de>"

ADD root /root

COPY start.sh \
    iptables_up.sh \
    iptables_down.sh \ 
    iptables_tcp.ini \
    iptables_udp.ini \
    /root/

RUN pacman -Syu --noconfirm iptables iproute2 && \
    chmod u+x /root/*.sh

ENTRYPOINT ["/root/start.sh"]

