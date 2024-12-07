#!/bin/bash

PPROTEIN_AGENT_VERSION="1.2.4"
PPROTEIN_AGENT_ARCH="${1:-amd64}"

DIR="/tmp/pprotein"

cd ${DIR}

mkdir -p ./usr/bin ./etc/systemd/system ./var/lib/pprotein DEBIAN

# control file
cp /tmp/control.${PPROTEIN_AGENT_ARCH} DEBIAN/control

# pprotein-agent
curl -LO https://github.com/kaz/pprotein/releases/download/v${PPROTEIN_AGENT_VERSION}/pprotein_${PPROTEIN_AGENT_VERSION}_linux_${PPROTEIN_AGENT_ARCH}.tar.gz
tar zxf pprotein_${PPROTEIN_AGENT_VERSION}_linux_${PPROTEIN_AGENT_ARCH}.tar.gz
rm -f pprotein pprotein_${PPROTEIN_AGENT_VERSION}_linux_${PPROTEIN_AGENT_ARCH}.tar.gz
mv pprotein-agent ./usr/bin/

# systemd
cp /tmp/pprotein-agent.service ./etc/systemd/system/

fakeroot dpkg-deb --build ${DIR} .
