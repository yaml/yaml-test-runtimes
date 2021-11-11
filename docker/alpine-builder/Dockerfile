FROM alpine:latest

RUN apk update \
 && apk add \
        bash \
        build-base \
        curl \
        git \
        go \
        perl-app-cpanminus \
        tig \
        vim \
        wget \
 && true

RUN cpanm -n \
        Capture::Tiny \
        XXX \
        YAML::PP \
 && true

RUN mkdir -p \
        /export/bin \
        /export/lib \
        /export/perl5/lib/perl5 \
 && true
