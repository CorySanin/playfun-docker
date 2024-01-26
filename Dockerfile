FROM debian:bullseye-slim AS build-env
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /playfun
RUN apt-get update \
 && apt-get install --no-install-recommends -y make build-essential clang-11 automake autoconf libtool libsdl1.2-dev libsdl-net1.2-dev zlib1g-dev libpng-dev libprotobuf-dev protobuf-compiler \
 && rm -rf /var/lib/apt/lists/*

COPY . .
RUN ./autogen.sh \
 && ./configure \
 && make

FROM debian:bullseye-slim AS deploy

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /playfun

RUN apt-get update \
 && apt-get install --no-install-recommends -y libsdl1.2-dev libsdl-net1.2 zlib1g libprotobuf23 \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir config \
 && ln -sf ./config/config.txt ./config.txt

COPY --from=build-env /playfun/tasbot /playfun
COPY ./start.sh .

ENTRYPOINT ["./start.sh"]