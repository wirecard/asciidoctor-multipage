FROM ruby:2.6

CMD apt-get update -y && apt-get upgrade -y

VOLUME /multipage
WORKDIR /multipage
