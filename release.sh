#!/bin/sh

set -xe

image_name='grtools'
version=$1

if [[ $version == "" ]];then
    version="latest"
fi

function release(){
    #git pull
    docker build -t ${image_name}:${version} .
    docker push ${image_name}:${version}
}

release


