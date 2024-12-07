#!/bin/bash

PPROTEIN_VERSION="1.2.4"
ALP_VERSION="1.0.21"
SLP_VERSION="0.2.1"

ARCH="${1:-amd64}"
PPROTEIN_ARCH="${ARCH}"
ALP_ARCH="${ARCH}"
SLP_ARCH="${ARCH}"

DIR="/tmp/pprotein"

cd ${DIR}

mkdir -p ./usr/bin ./etc/systemd/system ./var/lib/pprotein DEBIAN

# control file
cp /tmp/control.${ARCH} DEBIAN/control

# pprotein
curl -LO https://github.com/kaz/pprotein/releases/download/v${PPROTEIN_VERSION}/pprotein_${PPROTEIN_VERSION}_linux_${PPROTEIN_ARCH}.tar.gz
tar zxf pprotein_${PPROTEIN_VERSION}_linux_${PPROTEIN_ARCH}.tar.gz
rm -f pprotein-agent  pprotein_${PPROTEIN_VERSION}_linux_${PPROTEIN_ARCH}.tar.gz
mv pprotein ./usr/bin/

# alp
curl -LO https://github.com/tkuchiki/alp/releases/download/v${ALP_VERSION}/alp_linux_${ALP_ARCH}.tar.gz
tar zxf alp_linux_${ALP_ARCH}.tar.gz
rm -f alp_linux_${ALP_ARCH}.tar.gz
mv alp ./usr/bin/

# slp
curl -LO https://github.com/tkuchiki/slp/releases/download/v${SLP_VERSION}/slp_linux_${SLP_ARCH}.tar.gz
tar zxf slp_linux_${SLP_ARCH}.tar.gz
rm -f slp_linux_${SLP_ARCH}.tar.gz LICENSE README.md
mv slp ./usr/bin/

# systemd
cp /tmp/pprotein.service ./etc/systemd/system/

fakeroot dpkg-deb --build ${DIR} .
