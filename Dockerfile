FROM alpine
VOLUME ["/home/sdk","/work"]
RUN apk --no-cache --purge add alpine-sdk automake autoconf diffutils vim git linux-headers ncurses-dev
ENTRYPOINT [ "/bin/sh" ]
