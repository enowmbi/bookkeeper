FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /bookkeeper
WORKDIR /bookkeeper
COPY Gemfile /bookkeeper/Gemfile
COPY Gemfile.lock /bookkeeper/Gemfile.lock
RUN bundle install
COPY . /bookkeeper
