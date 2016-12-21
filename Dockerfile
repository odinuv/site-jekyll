FROM ruby:2.3

COPY Gemfile Gemfile.lock /code/
WORKDIR /code

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update &&
	apt-get install -y --no-install-recommends \
		wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundle \
  && gem install jekyll \
  && bundle install
