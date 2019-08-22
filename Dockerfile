FROM ruby:2.6

COPY Gemfile Gemfile.lock /code/
WORKDIR /code

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        php-ssh2 \
    && rm -r /var/lib/apt/lists/* \
    && gem install bundle \
    && gem install jekyll \
    && bundle install \
