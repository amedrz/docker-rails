FROM ruby:3.2

WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/

RUN bundle install

COPY . /usr/src/app/

EXPOSE 3000
