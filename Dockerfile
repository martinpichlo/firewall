#FROM base/archlinux
FROM alpine

LABEL maintainer="Zeaq"

ADD bin /usr/local/bin

#RUN pacman -Syu --noconfirm iptables && \
RUN apk add --no-cache iptables && \
    chmod u+x /usr/local/bin/*.sh

ENTRYPOINT ["start.sh"]

