FROM ubuntu:20.04

VOLUME [ "/station/config", "/station/data" ]

## PREPARE

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        libssl1.1:i386 \
        zlib1g:i386 \
        libtinfo6:i386 \
        ffmpeg

# BYOND
WORKDIR /byond
ARG BYOND_MAJOR
ARG BYOND_MINOR
ENV BYOND_LINUX_URL="http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"

RUN apt-get install -y --no-install-recommends \
        curl \
        unzip \
        make \
        libstdc++6:i386

RUN curl $BYOND_LINUX_URL -L -o byond.zip \
    && unzip byond.zip \
    && cd byond \
    && sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile \
    && make install \
    && chmod 644 /usr/local/byond/man/man6/* \
    && cd .. \
    && rm -rf byond byond.zip

# RUST
WORKDIR /rust_g
ARG RUSTG

RUN apt-get install -y --no-install-recommends \
        wget

RUN mkdir -p ~/.byond/bin \
  && wget -O ~/.byond/bin/librust_g.so "https://github.com/ss220-space/rust-g-tg/releases/download/${RUSTG}/librust_g.so" \
  && chmod +x ~/.byond/bin/librust_g.so \
  && ldd ~/.byond/bin/librust_g.so

# DMJIT
ARG DMJIT_VERSION="v0.1.0"

RUN mkdir -p ~/.byond/bin \
  && wget -O ~/.byond/bin/libdmjit.so "https://github.com/ss220-space/dmjit/releases/download/${DMJIT_VERSION}/libdmjit.so" \
  && chmod +x ~/.byond/bin/libdmjit.so \
  && ldd ~/.byond/bin/libdmjit.so

# NODE
WORKDIR /nodejs
ARG NODEJS
ENV NODEJS_LINK="https://deb.nodesource.com/setup_${NODEJS}.x"

RUN curl -sL $NODEJS_LINK -o nodesource_setup.sh \
	&& bash nodesource_setup.sh \
    && apt-get update \
    && rm -rf nodesource_setup.sh \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update

RUN apt-get -y install nodejs yarn

## BUILD
# Copy project to container
COPY . /station

# TGUI
WORKDIR /station/tgui
RUN yarn install && yarn build

# DreamMaker
ARG DREAM_MAKER_COMMAND="./tools/ci/dm.sh paradise.dme"
WORKDIR /station
RUN ${DREAM_MAKER_COMMAND}

## FINAL

# Run server
ENTRYPOINT DreamDaemon paradise.dmb -port 1337 -trusted -close -verbose
EXPOSE 1337
