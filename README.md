# docker-firewall
Simple iptables firewall based on Arch Linux

# Quick Start
docker run -d --cap-add=NET_ADMIN --network=host --name firewall zeaq/docker-firewall

# docker-compose
firewall:

    image: zeaq/docker-firewall

    restart: always

    cap_add:

        - NET_ADMIN

    network_mode: host


# Build
docker build docker-firewall -t firewall

docker run -d --cap-add=NET_ADMIN --network=host --name firewall firewall

