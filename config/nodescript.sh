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
pip install requests yaep pytz pycountry fuzzywuzzy python-Levenshtein


cd /app
curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app
chmod -R 777 /config/
chmod -R 777 /app/
node -v
npm -v

cd /app
npm start


