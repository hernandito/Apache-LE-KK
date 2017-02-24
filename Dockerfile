FROM linuxserver/baseimage.apache
MAINTAINER hernandito

WORKDIR /app

# copy sources.list
COPY sources.list /etc/apt/

ENV APTLIST="wget mc git tar curl inotify-tools nano zip python-software-properties python-setuptools python-dev build-essential"

# install main packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



ADD config/ /root/

# add local files
COPY root/ /

COPY run.sh /run.sh
RUN chmod u+rwx /run.sh


ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh
ADD nodescript.sh /root/nodescript.sh
RUN chmod +x /root/nodescript.sh



RUN mkdir -p /etc/letsencrypt

#ADD https://dl.eff.org/certbot-auto /usr/bin/certbot-auto
#RUN chmod a+x /usr/bin/certbot-auto

# add some files
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/service/*/finish /etc/my_init.d/*.sh


# ports and volumes
EXPOSE 5005
VOLUME /etc/letsencrypt /app
ENV YOUR_EMAIL=
ENV SINGLE_DOMAIN=
ENV YOUR_DOMAIN=


