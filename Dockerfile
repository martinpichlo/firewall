

FROM base/archlinux

LABEL maintainer="Zeaq <m dot pichlo at gmx dot de>"

RUN	pacman -Syu --noconfirm wget coreutils iptables iproute2 && \
	wget -q --no-check-certificate --output-document=/root/iptables.sh https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables.sh && \
	chmod u+x /root/iptables.sh
