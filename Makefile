BASH=sh
TAG_LATEST=`cat DOCKER_IMG_TAG_LATEST`

all: apache-all
apache-all: php-54-apache php-56-apache

php-54-apache:
	${BASH} ./bin/build.sh "5.4-apache" "apache/5.4" ${TAG_LATEST}

php-56-apache:
	${BASH} ./bin/build.sh "5.6-apache" "apache/5.6" ${TAG_LATEST}
