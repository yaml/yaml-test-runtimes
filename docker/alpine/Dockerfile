ARG FROM
FROM $FROM

RUN apk update \
 && apk add \
        autoconf \
        automake \
        bash \
        build-base \
        curl \
        git \
        go \
        icu-data-full \
        libtool \
        nodejs \
        npm \
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

RUN mkdir -p \
        /export/usr/lib \
        /export/usr/local/bin \
        /export/usr/local/lib \
        /export/usr/local/share/perl5/site_perl \
 && true
