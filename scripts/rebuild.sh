#!/usr/bin/env bash

set -e

#sed -i "s/%VERSION%/$(VERSION)/g" /home/centos/linkit360/go-utils/metrics/metrics.go;

build() {
    cd $1;

    rm -f ~/linkit/$2-linux-amd64; rm -f bin/$2-linux-amd64;

    export GOOS=linux; export GOARCH=amd64; \
        go build -ldflags "-s -w" -o bin/$2-linux-amd64; \

    cp bin/$2-linux-amd64 ~/linkit;
    cp dev/$2.yml ~/linkit/

    echo $1 ' OK';
    cd - ;
}

build go-contentd/server contentd;
build go-dispatcherd dispatcherd ;
build go-inmem/server inmem;
build go-jobs jobs;
build go-mt mt;
build go-partners/server partners;
build go-pixel pixel;
build go-qlistener qlistener;
build go-reporter/server reporter;
build go-operator/ph/yondu yondu;
build go-operator/pk/mobilink mobilink;
build go-operator/ru/beeline beeline;
build go-operator/th/qrtech qrtech;
build go-operator/th/cheese cheese;


getVersion() {
    version=$(git describe --always --long --dirty);
    echo $version;
}