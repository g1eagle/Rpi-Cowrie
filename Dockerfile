FROM resin/rpi-raspbian
MAINTAINER g1eagle

# Upgrade and install required packages

RUN apt-get update 
RUN sudo apt-get install git virtualenv libmpfr-dev libssl-dev libmpc-dev libffi-dev build-essential libpython-dev python-pip openssh-client
RUN pip install configparser
RUN sudo apt-get install git python-twisted python-configparser python-crypto python-pyasn1 python-gmpy2 python-mysqldb python-zope.interface

# Install cowrie
# RUN sudo apk add python py-asn1 py-twisted py-zope-interface libffi-dev py-cryptography py-pip py-six py-cffi py-idna py-ipaddress py-openssl
RUN sudo pip install enum34
RUN adduser --disabled-password --gecos '' cowrie
RUN sudo su - cowrie
RUN git clone http://github.com/micheloosterhof/cowrie
WORKDIR /cowrie
# RUN virtualenv cowrie-env
# RUN source cowrie-env/bin/activate
# RUN pip install -r requirements.txt
RUN cp cowrie.cfg.dist cowrie.cfg
WORKDIR /cowrie/data

RUN ssh-keygen -t dsa -b 1024 -f ssh_host_dsa_key
WORKDIR /cowrie
RUN export PYTHONPATH=/home/cowrie/cowrie
CMD ./start.sh
