#!/bin/sh

if [ ! -z ${PHP_OPCACHE_MEM_SIZE} ]; then
    STEP='Configuring OPcache shim size value'
    echo "[....] "${STEP}
    sed -i "s#;opcache.memory_consumption=.*#opcache.memory_consumption=${PHP_OPCACHE_MEM_SIZE}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_TIMEZONE} ]; then
    STEP='Configuring PHP timezone'
    echo "[....] "${STEP}
    sed -i "s#;date.timezone = .*#date.timezone = ${PHP_TIMEZONE}#g" /etc/php5/apache2/php.ini
    sed -i "s#;date.timezone = .*#date.timezone = ${PHP_TIMEZONE}#g" /etc/php5/cli/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_MEMORY_LIMIT} ]; then
    STEP='Configuring PHP memory limit'
    echo "[....] "${STEP}
    sed -i "s#memory_limit = .*#memory_limit = ${PHP_MEMORY_LIMIT}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_MAX_EXECUTION_TIME} ]; then
    STEP='Configuring PHP max execution time'
    echo "[....] "${STEP}
    sed -i "s#max_execution_time = .*#max_execution_time = ${PHP_MAX_EXECUTION_TIME}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_MAX_INPUT_TIME} ]; then
    STEP='Configuring PHP max input time'
    echo "[....] "${STEP}
    sed -i "s#max_input_time = .*#max_input_time = ${PHP_MAX_INPUT_TIME}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_UPLOAD_MAX_FILESIZE} ]; then
    STEP='Configuring PHP upload max filesize'
    echo "[....] "${STEP}
    sed -i "s#upload_max_filesize = .*#upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_POST_MAX_SIZE} ]; then
    STEP='Configuring PHP post max size'
    echo "[....] "${STEP}
    sed -i "s#post_max_size = .*#post_max_size = ${PHP_POST_MAX_SIZE}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_ERROR_REPORTING} ]; then
    STEP='Configuring PHP error reporting'
    echo "[....] "${STEP}
    sed -i "s#error_reporting = .*#error_reporting = ${PHP_POST_MAX_SIZE}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi
if [ ! -z ${PHP_DISPLAY_ERROR} ]; then
    STEP='Configuring PHP display error'
    echo "[....] "${STEP}
    sed -i "s#display_error = .*#display_error = ${PHP_DISPLAY_ERROR}#g" /etc/php5/apache2/php.ini
    echo "[ OK ] "${STEP}
fi

if [ ! -z ${PHP_SESSION_SAVE_HANDLER} ] || [ ! -z ${PHP_SESSION_SAVE_PATH} ]; then
    . $(dirname $0)/configure-sessions.sh
fi

if [ ! -z ${XDEBUG_ENABLE} ]; then
    . $(dirname $0)/configure-xdebug.sh
fi

exec "$@"
