#!/bin/bash
echo "$USER"  
adduser --disabled-password --gecos '' r
adduser cowrie sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo "import pty; pty.spawn('/bin/bash')" > /tmp/asdf.py
python /tmp/asdf.py
su -m r -c /cowrie/start.sh