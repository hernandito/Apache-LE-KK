#!/bin/bash


#apt-get update
#apt-get install -y python-software-properties
#apt-get install -y git
#apt-get install -y nano
#apt-get install python-setuptools python-dev build-essential 
#easy_install pip
#pip install --upgrade virtualenv 


mkdir -p /app/cache
mkdir -p /app/static
mkdir -p /app/static/clips
mkdir -p /app/presets
mkdir -p /app/settings



mv /root/settings.json /app/settings/settings.json
mv /root/presets.json /app/presets/presets.json
chmod -R 777 /app/


RUN chmod -R 777 /app/


cd /
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -


apt-get install -y nodejs

npm install --production
npm cache clean
npm install -g async 

pip install requests yaep pytz pycountry fuzzywuzzy python-Levenshtein



node -v
npm -v


curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app

cd /app/
