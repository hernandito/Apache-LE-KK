FROM linuxserver/baseimage.apache
MAINTAINER hernandito

# copy sources.list
COPY sources.list /etc/apt/

ENV APTLIST="libapache2-mod-php5 wget mc git tar curl inotify-tools php5-gd php5-sqlite php5-mcrypt php5-tidy php5-mysql libapache2-mod-proxy-html"

# install main packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



ADD config/ /root/

# add local files
COPY root/ /

ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

RUN mkdir -p /app
RUN mkdir -p /app/cache
RUN mkdir -p /app/static
RUN mkdir -p /app/static/clips
RUN mkdir -p /app/presets
RUN mkdir -p /app/settings


RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y git
RUN apt-get install -y nano
RUN apt-get install python-setuptools python-dev build-essential 
RUN easy_install pip
RUN pip install --upgrade virtualenv 



ADD settings.json /app/settings/settings.json
ADD presets.json /app/presets/presets.json
RUN chmod -R 777 /app/

RUN mkdir -p /etc/letsencrypt

#ADD https://dl.eff.org/certbot-auto /usr/bin/certbot-auto
#RUN chmod a+x /usr/bin/certbot-auto

# add some files
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/service/*/finish /etc/my_init.d/*.sh

# Update apache configuration with this one
RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers proxy_balancer proxy_connect proxy_html xml2enc authnz_ldap

# ports and volumes
EXPOSE 80 443 5005
VOLUME /config /etc/letsencrypt /app
ENV YOUR_EMAIL=
ENV SINGLE_DOMAIN=
ENV YOUR_DOMAIN=


