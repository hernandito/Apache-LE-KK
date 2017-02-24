#!/bin/bash


#apt-get update
#apt-get install -y python-software-properties
#apt-get install -y git
#apt-get install -y nano
#apt-get install python-setuptools python-dev build-essential 
#easy_install pip
#pip install --upgrade virtualenv 


cd /
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -


apt-get install -y nodejs

npm install --production

node -v
npm -v


