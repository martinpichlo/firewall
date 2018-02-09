

FROM	base/archlinux

LABEL	maintainer="Zeaq <m dot pichlo at gmx dot de>"

ADD	https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables_up.sh \
	https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables_down.sh \ 
	https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables_tcp.ini \
	https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables_udp.ini \
	/root/

#wget -q --no-check-certificate --output-document=/root/iptables.sh https://raw.githubusercontent.com/zeaq/docker-firewall/master/iptables.sh && \

RUN	pacman -Syu --noconfirm wget iptables iproute2 && \
	chmod u+x /root/*.sh

