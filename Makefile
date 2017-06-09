DOCKER_IMAGE_TAG?=jackschmidt/alpine-sdk

all: build README.md

build:
	docker build -t $(DOCKER_IMAGE_TAG) .

apk-info.txt:
	docker run -i --rm --entrypoint /sbin/apk $(DOCKER_IMAGE_TAG) info 2>/dev/null | sort > $@

README.md: Dockerfile apk-info.txt
	( \
		echo '# $(DOCKER_IMAGE_TAG)' ; \
		echo '' ; \
		echo '[![](https://images.microbadger.com/badges/image/$(DOCKER_IMAGE_TAG).svg)](https://microbadger.com/images/$(DOCKER_IMAGE_TAG) "Get your own image badge on microbadger.com")' ; \
		echo '' ; \
		echo 'This [Docker](https://store.docker.com/search?offering=community&type=edition) [image](https://hub.docker.com/r/$(DOCKER_IMAGE_TAG)) is enough to compile nice statically linked binaries without much trouble. It uses the small/simple/secure linux distribution [Alpine](https://alpinelinux.org/) to build the file. One nice feature is that the statically linked binaries can use some features that normally require a GLibC version match, but now can run in any version of GLibC.' ; \
		echo '' ; \
		echo 'The dockerfile is:' ; \
		echo '```Dockerfile' ; \
		cat Dockerfile ; \
		echo '```' ; \
		echo '' ; \
		echo 'The packages installed are:' ; \
		echo '```' ; \
		cat apk-info.txt ; \
		echo '```' \
	) > $@
