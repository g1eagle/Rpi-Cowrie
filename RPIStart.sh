#!/bin/bash
id -u somename &>/dev/null || adduser --disabled-password --gecos '' cowrie
id -u somename &>/dev/null || adduser cowrie sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo "import pty; pty.spawn('/bin/bash')" > /tmp/asdf.py
python /tmp/asdf.py
sh /cowrie/start.sh
