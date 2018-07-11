#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y docker.io
sudo service docker start

# $1 project key
docker run -v /:/host -v /var/run/docker.sock:/var/run/docker.sock --privileged --name cloudlensCollectorAgent -d --restart=on-failure --net=host ixiacom/cloudlens-agent --accept_eula yes --apikey $1 --server $2

echo "success"
