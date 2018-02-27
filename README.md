# docker-firewall
Simple iptables firewall for docker host based on Alpine Linux (tested on Arch Linux host)

## Quick Start
command:

    docker run -d --cap-add=NET_ADMIN --network=host --name firewall zeaq/docker-firewall

## docker-compose
docker-compose.yml:

    firewall:
        image: zeaq/docker-firewall
        restart: always
        cap_add:
            - NET_ADMIN
        network_mode: host

## Build
commands:

    docker build docker-firewall -t firewall
    docker run -d --cap-add=NET_ADMIN --network=host --name firewall firewall

