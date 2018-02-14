#!/bin/sh

# Autor: Martin Pichlo
# Date: 08.02.2018
# Description:
# - Simple Firewall Script for Arch Linux
# Assumptions:
# - after Arch Linux system start all chains are empty
# - may docker was started and has added automatic rules and chains
# Source:
# - https://wiki.archlinux.org/index.php/simple_stateful_firewall

#flush INPUT+OUTPUT chains (instead of 'iptables -F'), but leave FORWARD untouched (keeps automatic docker rules)
iptables -F INPUT
iptables -F OUTPUT

#delete specific user chains (instead of 'iptables -X'), but do not delete all user chains (keeps automatic docker chains)
iptables -F TCP 2>/dev/null
iptables -F UDP 2>/dev/null
iptables -X TCP 2>/dev/null
iptables -X UDP 2>/dev/null

# define policies for standard chains
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# allow incoming tcp packages for existing connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# drop packages with invalid headers
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# allow ping
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

# define own chains
iptables -N TCP
iptables -N UDP
iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP

# reject TCP connections with TCP RESET packets and UDP streams with ICMP port unreachable messages if the ports are not opened
iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

# reject all remaining incoming traffic with icmp protocol unreachable messages
iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable

