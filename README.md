# jackschmidt/alpine-sdk

This [Docker](https://store.docker.com/search?offering=community&type=edition) [image](https://hub.docker.com/r/jackschmidt/alpine-sdk) is enough to compile nice statically linked binaries without much trouble. It uses the small/simple/secure linux distribution [Alpine](https://alpinelinux.org/) to build the file. One nice feature is that the statically linked binaries can use some features that normally require a GLibC version match, but now can run in any version of GLibC.

The dockerfile is:
```Dockerfile
FROM alpine
VOLUME ["/home/sdk","/work"]
RUN apk --no-cache --purge add alpine-sdk automake autoconf diffutils vim git linux-headers ncurses-dev
ENTRYPOINT [ "/bin/sh" ]
```

The packages installed are:
```
abuild
acct
alpine-baselayout
alpine-keys
alpine-sdk
apk-tools
attr
autoconf
automake
binutils
binutils-libs
build-base
busybox
ca-certificates
cryptsetup-libs
curl
device-mapper-libs
diffutils
expat
fakeroot
fortify-headers
g++
gcc
git
gmp
isl
kmod
lddtree
libacl
libatomic
libattr
libblkid
libburn
libc-dev
libc-utils
libcap
libcurl
libedit
libgcc
libgomp
libisoburn
libisofs
libressl
libressl2.5-libcrypto
libressl2.5-libssl
libressl2.5-libtls
libssh2
libstdc++
libuuid
linux-headers
lua5.2-libs
lzip
lzo
m4
make
mkinitfs
mpc1
mpfr3
mtools
musl
musl-dev
musl-utils
ncurses-dev
ncurses-libs
ncurses-terminfo
ncurses-terminfo-base
patch
pax-utils
pcre
perl
pkgconf
scanelf
squashfs-tools
sudo
tar
vim
xorriso
xz-libs
zlib
```
