#!/bin/bash
dpkg -l | grep -i docker && \
sudo apt-get purge -y docker-engine docker docker.io docker-ce  && \
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  && \
sudo service docker stop 
sudo rm -rf /var/lib/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
