FROM ruby:3.1.2

RUN apt-get update && apt-get install -y vim less \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client \
    yarn

RUN mkdir /myproject 
WORKDIR /myproject

ADD Gemfile /myproject/Gemfile
ADD Gemfile.lock /myproject/Gemfile.lock
RUN bundle install

ADD . /myproject
