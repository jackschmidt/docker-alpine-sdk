DOCKER_IMAGE_TAG?=jackschmidt/alpine-sdk

all: build README.md

build:
	docker build -t $(DOCKER_IMAGE_TAG) .

apk-info.txt:
	docker run -i --rm --entrypoint /sbin/apk $(DOCKER_IMAGE_TAG) info 2>/dev/null | sort > $@

README.md: Dockerfile apk-info.txt
	sed -i '/```Dockerfile/,$$d' $@ && ( \
		echo '```Dockerfile' ; \
		cat Dockerfile ; \
		echo '```' ; \
		echo '' ; \
		echo 'The packages installed are:' ; \
		echo '```' ; \
		cat apk-info.txt ; \
		echo '```' \
	) >> $@
