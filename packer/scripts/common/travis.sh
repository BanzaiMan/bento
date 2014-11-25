#!/bin/bash

mkdir ~travis/.ssh
wget --no-check-certificate \
    'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
    -O ~travis/.ssh/authorized_keys
chown -R travis ~travis/.ssh
chmod -R go-rwsx ~travis/.ssh
