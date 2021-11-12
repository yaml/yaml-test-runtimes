FROM alpine:latest

RUN apk update \
 && apk add \
        autoconf \
        automake \
        bash \
        build-base \
        curl \
        git \
        go \
        libtool \
        perl \
        perl-app-cpanminus \
        pkgconf \
        python3 \
        py3-pip \
        the_silver_searcher \
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
        /export/usr/local/bin \
        /export/usr/local/lib \
        /export/usr/local/share/perl5/site_perl \
 && true
