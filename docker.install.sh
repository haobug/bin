#sudo apt-get remove docker docker-engine docker.io
#docker_uninstall.sh
sudo apt-get remove docker docker-engine docker.io containerd runc && \
sudo apt-get update
sudo apt-get install -y \
		 apt-transport-https \
		 ca-certificates \
		 curl \
		 gnupg-agent \
		 software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \

sudo apt-key fingerprint 0EBFCD88|grep '9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88' && \

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io && \

sudo groupadd docker
sudo usermod -a -G docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

newgrp docker 
docker run hello-world

#install as service
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
