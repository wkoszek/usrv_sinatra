FROM ubuntu:18.04

MAINTAINER Wojciech Adam Koszek "wojciech@koszek.com"

WORKDIR /app

ADD Gemfile /usr/src/Gemfile
#ADD Gemfile.lock /usr/src/Gemfile.lock
ADD . /app

RUN \
	apt-get update && \
	apt-get -y install ruby gcc g++ make ruby-dev ruby-bundler && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	bundle install --without development test && \
	mkdir tmp

CMD bundle exec unicorn -c /app/unicorn.rb
