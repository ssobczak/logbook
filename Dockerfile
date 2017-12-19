FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir /logbook
WORKDIR /logbook

COPY Gemfile /logbook/Gemfile
COPY Gemfile.lock /logbook/Gemfile.lock
RUN bundle install
COPY . /logbook
