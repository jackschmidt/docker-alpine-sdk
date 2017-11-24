DOCKER_HUB_USER=jackschmidt
DOCKER_HUB_REPO=alpine-sdk
DOCKER_HUB_TAG=edge
DOCKER_IMAGE_NAME=$(DOCKER_HUB_USER)/$(DOCKER_HUB_REPO):$(DOCKER_HUB_TAG)

all: pull README.md

pull:
	docker pull alpine:edge
	docker pull arm32v6/alpine:edge

README.md: x86_64/README.md rpi/README.md
	cat $^ > $@

%/README.md: %/Dockerfile build-%
	( \
		echo '# $(DOCKER_IMAGE_NAME)-$*' ; \
		echo '' ; \
		echo '[![](https://images.microbadger.com/badges/image/$(DOCKER_IMAGE_NAME)-$*.svg)](https://microbadger.com/images/$(DOCKER_IMAGE_NAME)-$* "Get your own image badge on microbadger.com")' ; \
		echo '[![](https://images.microbadger.com/badges/commit/jackschmidt/alpine-sdk.svg)](https://microbadger.com/images/jackschmidt/alpine-sdk "Get your own commit badge on microbadger.com")' ; \
		echo '' ; \
		echo 'This [Docker](https://store.docker.com/search?offering=community&type=edition) [image](https://hub.docker.com/r/$(DOCKER_IMAGE_NAME)-$*) is enough to compile nice statically linked binaries without much trouble. It uses the small/simple/secure linux distribution [Alpine](https://alpinelinux.org/) to build the file. One nice feature is that the statically linked binaries can use some features that normally require a GLibC version match, but now can run in any version of GLibC.' ; \
		echo '' ; \
		echo 'The dockerfile is:' ; \
		echo '```Dockerfile' ; \
		cat $< ; \
		echo '```' ; \
		echo '' ; \
		echo 'The packages installed are:' ; \
		echo '```' ; \
		docker run -i --rm --entrypoint /sbin/apk $(DOCKER_IMAGE_NAME)-$* info -v 2>/dev/null | sort ; \
		echo '```' \
	) > $@

build-%: %/Dockerfile
	docker build -t $(DOCKER_IMAGE_NAME)-$* $*
