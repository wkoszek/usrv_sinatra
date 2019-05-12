FROM ubuntu:19.04

MAINTAINER Wojciech Adam Koszek "wojciech@koszek.com"

WORKDIR /src
ADD ./Gemfile /src/Gemfile
ADD ./Gemfile.lock /src/Gemfile.lock
ADD ./vendor /src/vendor

RUN apt-get update && \
	apt-get -y install ruby ruby-bundler && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	bundle install --deployment

CMD bundle exec unicorn -c /app/unicorn.rb
