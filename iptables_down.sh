#!/bin/bash

#flush INPUT+OUTPUT chains (instead of 'iptables -F'), but leave FORWARD untouched (keeps automatic docker rules)
iptables -F INPUT
iptables -F OUTPUT

#delete specific user chains (instead of 'iptables -X'), but do not delete all user chains (keeps automatic docker chains)
iptables -F TCP 2>/dev/null
iptables -F UDP 2>/dev/null
iptables -X TCP 2>/dev/null
iptables -X UDP 2>/dev/null

# define policies for standard chains
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

