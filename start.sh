#!/bin/bash

_DOWN() {
    $(./root/iptables_down.sh)
    trap - SIGTERM # clear the trap
    echo "...Firewall down"
}

trap _DOWN SIGTERM

echo "Start Firewall..."
$(./root/iptables_up.sh)

#other commands here
sleep infinity
