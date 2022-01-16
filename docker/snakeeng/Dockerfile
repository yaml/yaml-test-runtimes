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
 && git fetch origin master \
 && git reset --hard FETCH_HEAD \
 && true

RUN mvn clean install

COPY java /java

WORKDIR /java

RUN version=$TAG \
 && version=${version#snakeengine-} \
 && mvn clean compile -Dsnakeengineversion="$version" \
 && mvn assembly:single -Dsnakeengineversion="$version" \
 && true

RUN mkdir -p /export/java \
 && mv target/snakeengine2events-*-jar-with-dependencies.jar /export/java

COPY bin/* /export/usr/local/bin/
