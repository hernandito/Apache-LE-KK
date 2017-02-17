#!/bin/bash


apt-get update
apt-get install -y python-software-properties
apt-get install -y git
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs

node -v
npm -v


#   KodiKontrol
#============================================
# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install kodi kontrol
 npm install -g async programmerben/KodiKontrol

 
 
 
# config kodikontrol
 mv /usr/lib/node_modules/KodiKontrol/config.js  /defaults/ 

# cleanup
 apk del --purge build-dependencies 
 npm cache clean\
 rm -rf /tmp
#============================================