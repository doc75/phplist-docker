#!/bin/bash

VERSION=$1

cd "$(dirname "$0")"

if [[ -n $VERSION ]]; then
    docker rmi -f phplist/phplist:$VERSION
    docker system prune -f
    docker build --build-arg PHPLIST_VERSION=$VERSION --no-cache --pull -f Dockerfile -t phplist/phplist:$VERSION .
#    docker push phplist/phplist:$VERSION
else
    docker rmi -f phplist/phplist:latest
    #docker build --no-cache -f Dockerfile.git -t phplist/phplist:latest .
    docker build -f Dockerfile.git -t phplist/phplist:latest .
#    docker push phplist/phplist:latest
fi

