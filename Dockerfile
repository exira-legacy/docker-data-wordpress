FROM exira/base:latest

MAINTAINER exira.com <info@exira.com>

ENV WORDPRESS_VERSION=4.4.2 \
    WORDPRESS_SHA1=7444099fec298b599eb026e83227462bcdf312a6

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache wget && \

    # download unpack wordpress
    mkdir /tmp/wp/ && \
    cd /tmp/wp/ && \
    wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz --no-check-certificate -O /tmp/wordpress.tar.gz && \
    #echo "${WORDPRESS_SHA1} /tmp/wordpress.tar.gz" | sha1sum -c - && \
    mkdir /var/www/ && \
    tar xvfz /tmp/wordpress.tar.gz -C /var/www && \
    mv /var/www/wordpress/* /var/www/ && \
    rmdir /var/www/wordpress && \
    rm -f /tmp/wordpress.tar.gz && \

    # cleanup
    apk del wget && \
    rm -rf /var/cache/apk/*

VOLUME /var/www/
