FROM debian:jessie

MAINTAINER Guillaume Maïssa <pro.g@maissa.fr>

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y apt-utils ca-certificates openssh-server sudo unzip strace tree vim htop supervisor && \
    apt-get install --force-yes -y libapache2-mod-php5 php5 php5-cli php5-curl php5-intl php5-common php5-mcrypt \
        php5-mysql php5-xsl php5-gd php5-memcached imagemagick gzip libxml2 curl git-core wget && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

# Disable Apache autostart and enable common modules
RUN sudo systemctl disable apache2 && \
    a2enmod rewrite headers expires

# Declaring volumes to be mounted
VOLUME /var/www/project

WORKDIR /var/www/project

COPY config/ /config/
COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

# Add default vhost file
RUN rm /etc/apache2/sites-available/000-default.conf && \
    ln -s /config/apache2/default /etc/apache2/sites-available/000-default.conf

# Expose port
EXPOSE 80 443

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["supervisord", "-c", "/config/supervisord/supervisord.conf"]

