#!/bin/sh

if [ ! -z ${PHP_SESSION_SAVE_HANDLER} ]; then
    STEP='Configuring PHP session save handler'
    echo "[....] "${STEP}
    sed -i "s#session.save_handler = .*#session.save_handler = ${PHP_SESSION_SAVE_HANDLER}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_SESSION_SAVE_PATH} ]; then
    STEP='Configuring PHP session save path'
    echo "[....] "${STEP}
    sed -i "s#;session.save_path = .*#session.save_path = ${PHP_SESSION_SAVE_PATH}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
