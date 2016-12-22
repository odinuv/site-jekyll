FROM ruby:2.3

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

COPY wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb /tmp/
WORKDIR /tmp

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		fontconfig \
		xfonts-base \
		xfonts-75dpi \
	&& dpkg -i /tmp/wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb \
	&& apt-get install -f -y \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock /code/
WORKDIR /code

RUN gem install bundle \
  && gem install jekyll \
  && bundle install
