#!/bin/bash
adduser --disabled-password --gecos '' r
adduser cowrie sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
su -m r -c /cowrie/start.sh