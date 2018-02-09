# docker-firewall
Simple Firewall

## Quick Start
docker run -d --cap-add=NET_ADMIN --network=host zeaq/docker-firewall

## Build
docker build docker-firewall -t firewall

docker run -d --cap-add=NET_ADMIN --network=host --name firewall firewall
