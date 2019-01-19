#!/usr/bin/env bash
set -xe

buildDeps="build-essential \
  wget"

apt-get update -yqq
apt-get install -yqq --no-install-recommends \
  $buildDeps

# install JVM
mkdir -p /usr/share/man/man1 # fix for ubuntu - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
apt-get install -y openjdk-8-jdk

#install Spark
wget -P /tmp -q  "http://apache.mirror.iphh.net/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz"
mkdir -p /usr/lib/Spark
tar xf /tmp/spark-2.3.0-bin-hadoop2.7.tgz -C /usr/lib/Spark --strip-components 1
curl http://repo1.maven.org/maven2/com/sun/jersey/jersey-bundle/1.19.1/jersey-bundle-1.19.1.jar -o /usr/lib/Spark/jars/jersey-bundle-1.19.1.jar
chmod 777 /usr/lib/Spark
chmod 777 /usr/lib/Spark/bin

# dumb-init
wget -qO /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
chmod +x /usr/bin/dumb-init

# cleanup
apt-get purge --auto-remove -yqq $buildDeps
apt-get clean

rm -rf \
  /var/lib/apt \
  /var/cache/apt \
  /root/.cache \
  /tmp/* \
  /var/tmp/* \
  /usr/share/man \
  /usr/share/doc \
  /usr/share/doc-base
