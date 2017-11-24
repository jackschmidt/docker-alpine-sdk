# jackschmidt/alpine-sdk:edge-x86_64

[![](https://images.microbadger.com/badges/image/jackschmidt/alpine-sdk:edge-x86_64.svg)](https://microbadger.com/images/jackschmidt/alpine-sdk:edge-x86_64 "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/jackschmidt/alpine-sdk.svg)](https://microbadger.com/images/jackschmidt/alpine-sdk "Get your own commit badge on microbadger.com")

This [Docker](https://store.docker.com/search?offering=community&type=edition) [image](https://hub.docker.com/r/jackschmidt/alpine-sdk:edge-x86_64) is enough to compile nice statically linked binaries without much trouble. It uses the small/simple/secure linux distribution [Alpine](https://alpinelinux.org/) to build the file. One nice feature is that the statically linked binaries can use some features that normally require a GLibC version match, but now can run in any version of GLibC.

The dockerfile is:
```Dockerfile
FROM alpine:edge
RUN     sed -i 's/v3.6/edge/' /etc/apk/repositories && \
        apk add -U -u --purge \
                alpine-base \
                alpine-conf \
                alpine-sdk \
                apk-tools \
                autoconf \
                automake \
                build-base \
                busybox \
                diffutils \
                git \
                fakeroot \
                grub-efi \
                linux-headers \
                linux-virthardened \
                musl \
                ncurses-dev \
                rsync \
                squashfs-tools \
                syslinux \
                vimdiff \
                xorriso \
        ; true
RUN     addgroup root abuild ; \
        mkdir -p -m 755 /root/.abuild ; \
        adduser abuild -G abuild -D -s /bin/ash ; \
        mkdir -m 755 -p ~abuild/.abuild ; \
        chown abuild.abuild -R ~abuild
CMD ["/bin/sh"]
ARG BUILD_DATE
ARG SOURCE_TAG
ARG SOURCE_COMMIT
LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Alpine SDK" \
        org.label-schema.description="A Docker image for building static binaries using Alpine SDK" \
        org.label-schema.vcs-ref=$SOURCE_COMMIT \
        org.label-schema.vcs-url="https://github.com/jackschmidt/docker-alpine-sdk" \
        org.label-schema.version=$SOURCE_TAG \
        org.label-schema.schema-version="1.0"

```

The packages installed are:
```
abuild-3.1.0-r3
acct-6.6.4-r0
alpine-base-3.7.0_rc1-r0
alpine-baselayout-3.0.5-r2
alpine-conf-3.7.0_rc1-r0
alpine-keys-2.1-r1
alpine-sdk-0.5-r0
apk-tools-2.8.1-r1
attr-2.4.47-r6
autoconf-2.69-r0
automake-1.15.1-r0
binutils-2.28-r3
binutils-libs-2.28-r3
blkid-2.31-r0
build-base-0.5-r0
busybox-1.27.2-r4
busybox-initscripts-3.1-r2
busybox-suid-1.27.2-r4
ca-certificates-20171114-r0
cryptsetup-libs-1.7.5-r1
curl-7.56.1-r1
device-mapper-libs-2.02.175-r0
diffutils-3.6-r0
expat-2.2.5-r0
fakeroot-1.21-r1
fortify-headers-0.9-r0
freetype-2.8.1-r2
g++-6.4.0-r5
gcc-6.4.0-r5
git-2.15.0-r1
gmp-6.1.2-r1
grub-2.02-r3
grub-efi-2.02-r3
isl-0.18-r0
kmod-24-r0
lddtree-1.26-r1
libacl-2.2.52-r3
libatomic-6.4.0-r5
libattr-2.4.47-r6
libblkid-2.31-r0
libburn-1.4.8-r0
libbz2-1.0.6-r6
libc-dev-0.7.1-r0
libc-utils-0.7.1-r0
libcap-2.25-r1
libcurl-7.56.1-r1
libedit-20170329.3.1-r3
libgcc-6.4.0-r5
libgomp-6.4.0-r5
libisoburn-1.4.8-r0
libisofs-1.4.8-r0
libpng-1.6.34-r1
libressl-2.6.3-r0
libressl2.6-libcrypto-2.6.3-r0
libressl2.6-libssl-2.6.3-r0
libressl2.6-libtls-2.6.3-r0
libssh2-1.8.0-r2
libstdc++-6.4.0-r5
libuuid-2.31-r0
linux-headers-4.4.6-r2
linux-virthardened-4.9.65-r0
lua5.2-libs-5.2.4-r4
lz4-libs-1.8.0-r1
lzip-1.19-r1
lzo-2.10-r2
m4-1.4.18-r0
make-4.2.1-r0
mkinitfs-3.2.0-r0
mpc1-1.0.3-r1
mpfr3-3.1.5-r1
mtools-4.0.18-r2
musl-1.1.18-r2
musl-dev-1.1.18-r2
musl-utils-1.1.18-r2
ncurses-dev-6.0_p20170930-r0
ncurses-libs-6.0_p20170930-r0
ncurses-terminfo-6.0_p20170930-r0
ncurses-terminfo-base-6.0_p20170930-r0
openrc-0.24.1-r3
patch-2.7.5-r1
pax-utils-1.2.2-r1
pcre2-10.30-r0
perl-5.26.1-r1
pkgconf-1.3.10-r0
popt-1.16-r7
rsync-3.1.2-r6
scanelf-1.2.2-r1
squashfs-tools-4.3-r4
sudo-1.8.21_p2-r1
syslinux-6.04_pre1-r1
tar-1.29-r1
vim-8.0.1300-r0
vimdiff-8.0.1300-r0
xorriso-1.4.8-r0
xz-libs-5.2.3-r1
zlib-1.2.11-r1
```
