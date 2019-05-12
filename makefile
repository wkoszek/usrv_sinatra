init:
	docker run -v `pwd`:/src wkoszek/ruby_build
build:
	docker build -t usrv_sinatra .
run:
	docker run -p 8080:8080 -v `pwd`:/app usrv_sinatra
