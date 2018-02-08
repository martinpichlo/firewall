

FROM base/archlinux

LABEL maintainer="Zeaq <m dot pichlo at gmx dot de>"

##iptables iproute2

RUN	pacman -Syu --noconfirm wget && \
	wget --no-check-certificate --output-document=/root/test.sh https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables.sh \
	chmod u+x /root/iptables.sh
