# allow specific tcp ports
iptables -A TCP -p tcp --dport 22 -j ACCEPT
iptables -A TCP -p tcp --dport 443 -j ACCEPT
#iptables -A TCP -p tcp --dport 80 -j ACCEPT

# allow specific udp ports
# iptables -A UDP -p udp --dport 53 -j ACCEPT
