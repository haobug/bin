#!/bin/bash
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
dpkg -l | grep -i docker && \
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo apt-get purge docker-engine docker docker.io docker-ce
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  && \
sudo service docker stop 
sudo rm -rf /var/lib/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
