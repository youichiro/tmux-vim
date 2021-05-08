FROM ubuntu:18.04

# setup timezone
RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get clean

ENV TZ Asia/Tokyo

RUN apt-get install -y language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# install vim
RUN apt-get install -y vim

# install tmux 3.2
RUN apt install -y git automake bison build-essential pkg-config libevent-dev libncurses5-dev
RUN mkdir /usr/local/src/tmux
RUN git clone -b 3.2 https://github.com/tmux/tmux /usr/local/src/tmux
WORKDIR /usr/local/src/tmux
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local
RUN make
RUN make install

WORKDIR /root

