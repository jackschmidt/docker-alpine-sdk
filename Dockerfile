FROM alpine
RUN apk --no-cache --purge add alpine-sdk automake autoconf diffutils git linux-headers ncurses-dev
CMD ["/bin/sh"]
ARG BUILD_DATE
ARG SOURCE_TAG
ARG SOURCE_COMMIT
LABEL	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="Alpine SDK" \
	org.label-schema.description="A Docker image for building static binaries using Alpine SDK" \
	org.label-schema.vcs-ref=$SOURCE_COMMIT \
	org.label-schema.vcs-url="https://github.com/jackschmidt/docker-alpine-sdk" \
	org.label-schema.version=$SOURCE_TAG \
	org.label-schema.schema-version="1.0"

