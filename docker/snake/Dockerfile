ARG FROM
FROM $FROM
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

RUN version=$TAG \
 && version=${version#snakeyaml-} \
 && mvn clean compile -Dsnakeversion="$version" \
 && mvn assembly:single -Dsnakeversion="$version" \
 && true

RUN mkdir -p /export/java \
 && mv target/snake2json-*-jar-with-dependencies.jar /export/java

COPY bin/* /export/usr/local/bin/
