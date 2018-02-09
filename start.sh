#!/bin/bash

exit_script() {
    $(./root/iptables_down.sh)
#    trap - SIGINT SIGTERM # clear the trap
    echo "...Firewall down"
    exit 1
}

trap exit_script SIGINT SIGTERM

echo "Start Firewall..."
$(./root/iptables_up.sh)

#other commands here
#sleep infinity
while :; do :; done
