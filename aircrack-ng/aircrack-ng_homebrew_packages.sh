#!/bin/zsh

# Homebrew recommended packages to install alongide Aircrack-ng

brew install autoconf automake libtool openssl shtool pkg-config hwloc pcre sqlite3 libpcap sqlite wget

 wget https://download.aircrack-ng.org/aircrack-ng-1.7.tar.gz

tar -zxvf aircrack-ng-1.7.tar.gz \
 cd aircrack-ng-1.7 \
 autoreconf -i \
 ./configure --with-experimental \
 make \
 make install \
 ldconfig \

