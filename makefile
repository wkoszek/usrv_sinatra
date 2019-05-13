init:
	docker run -v `pwd`:/src wkoszek/ruby_build
build:
	docker build -t `cat .app/name` .
run:
	docker run -p 8080:8080 -v `pwd`:/app `cat .app/name`
sync:
	rsync -va --exclude vendor . w:/home/ubuntu/apps/`cat .app/name`
