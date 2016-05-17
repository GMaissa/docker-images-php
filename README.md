# Docker Images for PHP

PHP Docker images based on Debian distribs.

[CHANGELOG](https://github.com/GMaissa/docker-php/blob/master/CHANGELOG.md)

## Supported tags and respective `Dockerfile` links

Image                     | Dockerfile                                                                                          | Info                                                                       
--------------------------|-----------------------------------------------------------------------------------------------------| ----------------------------------------------
`5.4-apache`              | [*apache/5.4/Dockerfile*](https://github.com/Gmaissa/docker-php/blob/master/apache/5.4/Dockerfile)  | [![](https://badge.imagelayers.io/gmaissa/php:5.4-apache.svg)](https://imagelayers.io/?images=gmaissa/php:5.4-apache 'Get your own badge on imagelayers.io')
`5.6-apache`, `latest`    | [*apache/5.6/Dockerfile*)](https://github.com/GMaissa/docker-php/blob/master/apache/5.6/Dockerfile) | [![](https://badge.imagelayers.io/gmaissa/php:5.6-apache.svg)](https://imagelayers.io/?images=gmaissa/php:5.6-apache 'Get your own badge on imagelayers.io')

## PHP modules
Some modules are installed by default :

 - php5-cli
 - php5-curl
 - php5-intl
 - php5-common
 - php5-mcrypt
 - php5-mysql
 - php5-xsl
 - php5-gd
 - php5-memcached
 
## Volumes

Path             | Info
-----------------|-------------------------------------------------------
/var/www/project | App sources directory (also used as default docroot)

## Exposed ports

Port  | Info
------|-----------------------
80    | Apache default port
443   | Apache SSL port

## Environment variables

There are environment variables which can be passed to images on docker run

Variable                  | Description
--------------------------|---------------------------------------------------------------------------
`PHP_OPCACHE_MEM_SIZE`    | Memory amount to use to store opcode cache
`PHP_TIMEZONE`            | PHP Timezone for both webserver/FPM and CLI
`PHP_MEMORY_LIMIT`        | Memory limit for `php_mods` or FPM
`PHP_MAX_EXECUTION_TIME`  | Max execution time
`PHP_MAX_INPUT_TIME`      | Max input time
`PHP_UPLOAD_MAX_FILESIZE` | Max size for uploaded files
`PHP_POST_MAX_SIZE`       | Max size for post data
`PHP_CLI_MEMORY_LIMIT`    | Memory limit for CLI
`PHP_ERROR_REPORTING`     | Error reporting configuration
`PHP_DISPLAY_ERROR`       | Error display configuration
`PHP_SESSION_SAVE_HANDLER`| Handler to use to store session
`PHP_SESSION_SAVE_PATH`   | Path where to store sessions
`XDEBUG_ENABLE`           | Enable xdebug (will install module)
`XDEBUG_REMOTE_HOST`      | XDebug remote host configuration (will be configured if XDebug is enabled
`XDEBUG_REMOTE_PORT`      | XDebug remote port configuration (will be configured if XDebug is enabled
`BLACKFIRE_ENABLE`        | Enable Blackfire probe (will install module)
`BLACKFIRE_AGENT_HOST`    | Blackfire agent host (default is blackfire:8707)


