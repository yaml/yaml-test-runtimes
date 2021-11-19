FROM yamlio/yaml-test-alpine-base:0.0.1

ARG REPO
ARG TAG

RUN apk update \
 && apk add \
        maven \
        musl \
        openjdk8 \
 && true

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && true

RUN mvn clean install

COPY java /java

WORKDIR /java

RUN mvn clean compile -Dsnakeversion=1.29

RUN mvn assembly:single -Dsnakeversion=1.29

RUN mkdir -p /export/java \
 && mv target/snake2json-*-jar-with-dependencies.jar /export/java
