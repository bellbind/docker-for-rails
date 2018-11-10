FROM ruby:latest
MAINTAINER bellbind

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /tmp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 mecab-naist-jdic

CMD bash
