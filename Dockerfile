FROM ruby:2.4.2-alpine

RUN apk add --update --no-cache alpine-sdk make gcc postgresql-dev

RUN gem install bundler && \
    bundle config --global path vendor/bundle && \
    bundle config --global jobs 4

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --update --no-cache libuv@edge nodejs@edge && \
    npm i -g yarn

RUN apk add --no-cache tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
