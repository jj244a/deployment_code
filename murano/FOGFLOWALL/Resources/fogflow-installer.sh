
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update

sudo apt-cache policy docker-ce

sudo apt-get install -y docker-ce

sudo systemctl status docker

sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#download the deployment script
mkdir /tmp/fogflow

cd /tmp/fogflow

wget https://raw.githubusercontent.com/smartfog/fogflow/master/deployment/core/docker-compose.yml

#download the configuration file
wget https://raw.githubusercontent.com/smartfog/fogflow/master/deployment/core/config.json

#DockerIP=$(ip -4 addr show docker0 | grep -oP "(?<=inet ).*(?=/)")

#sed -i  's/"internal_hostip":.*/"internal_hostip":'$DockerIP'/' config.json


