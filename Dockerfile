#FROM base/archlinux
FROM alpine:latest

LABEL maintainer="Zeaq"

ADD bin /usr/local/bin

#RUN pacman -Syu --noconfirm iptables && \
RUN apk add --update --no-cache iptables && \
    chmod u+x /usr/local/bin/*.sh

ENTRYPOINT ["start.sh"]

