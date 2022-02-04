ARG FROM
FROM $FROM
ARG REPO
ARG TAG

RUN apk add \
        cmake \
        linux-headers \
 && true

WORKDIR /build

RUN git init --quiet \
 && git remote add origin $REPO \
 && git fetch origin $TAG \
 && git reset --hard FETCH_HEAD \
 && git submodule update --init --recursive \
 && true

RUN cmake \
        -S . \
        -B build \
        -D CMAKE_BUILD_TYPE=Debug \
        -D BUILD_SHARED_LIBS=OFF \
        -D RYML_BUILD_TOOLS=ON \
 && true

RUN cmake \
        --build build \
        -j \
        --target ryml-yaml-events \
 && true

RUN cp \
        "$(find build -name 'ryml-yaml-events*' -type f)" \
        /export/usr/local/bin/ryml-yaml-events \
 && true

COPY bin/yaml-test-parse-rapid \
        /export/usr/local/bin/
