FROM elixir:1.3.4
MAINTAINER szymon.ciolkowski@gmail.com

RUN useradd -d /home/docker -m -s /bin/bash docker \
&& echo "docker:docker" | chpasswd \
&& adduser docker sudo \
&& chown -R docker:docker /home/docker \
&& mkdir -p /home/docker/udemy_elixir \
&& mix local.hex --force \
&& mix local.rebar --force \
&& mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez \
&& curl -sL https://deb.nodesource.com/setup_6.x | bash - \
&& apt-get install -y -q nodejs

WORKDIR /home/docker/udemy_elixir

USER docker
