FROM node:latest
MAINTAINER Juan Saavedra <jsaavedra@octobot.io>
RUN apt-get update &&\
  apt-get install -y\
    ruby\
    rubygems\
    ruby-dev\
    python3\
    python3-pip &&\
  gem install sass &&\
  gem install compass
VOLUME /usr/development/app
WORKDIR /usr/development/app
RUN npm install -g yo bower grunt-cli gulp-cli gulp grunt create-react-app
RUN useradd --create-home --shell /bin/bash non-root &&\
  usermod -aG sudo non-root &&\
  chown -R non-root:non-root /usr/development/app
USER non-root
EXPOSE 9000 3000
CMD ["gulp", "serve"]
