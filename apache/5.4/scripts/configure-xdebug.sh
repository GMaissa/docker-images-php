#!/bin/sh

STEP='Configuring XDebug'
echo "[....] "${STEP}
if [ $(php -m | grep 'xdebug' | wc -l) -eq 0 ]; then
    apt-get install php5-xdebug
fi
if [ -f /etc/php5/conf.d/20-xdebug.ini ]; then
    if [ $(cat /etc/php5/conf.d/20-xdebug.ini | grep 'xdebug.remote_enable' | wc -l) -eq 0 ]; then
        echo "xdebug.remote_enable=1" >> /etc/php5/conf.d/20-xdebug.ini
    fi
    if [ ! -z ${XDEBUG_REMOTE_HOST} ]; then
        if [ $(cat /etc/php5/conf.d/20-xdebug.ini | grep 'xdebug.remote_host' | wc -l) -eq 0 ]; then
            echo "xdebug.remote_host=${XDEBUG_REMOTE_HOST}" >> /etc/php5/conf.d/20-xdebug.ini
        else
            sed -i "s#xdebug.remote_host=.*#xdebug.remote_host=${XDEBUG_REMOTE_HOST}#g" /etc/php5/conf.d/20-xdebug.ini
        fi
    fi
    if [ ! -z ${XDEBUG_REMOTE_PORT} ]; then
        if [ $(cat /etc/php5/conf.d/20-xdebug.ini | grep 'xdebug.remote_port' | wc -l) -eq 0 ]; then
            echo "xdebug.remote_port=${XDEBUG_REMOTE_PORT}" >> /etc/php5/conf.d/20-xdebug.ini
        else
            sed -i "s#xdebug.remote_port=.*#xdebug.remote_port=${XDEBUG_REMOTE_PORT}#g" /etc/php5/conf.d/20-xdebug.ini
        fi
    fi
fi
echo "[ OK ] "${STEP}
