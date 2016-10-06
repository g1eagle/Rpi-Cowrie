FROM resin/rpi-raspbian
MAINTAINER g1eagle

# Upgrade and install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
	git \
	libmpfr-dev \
	libssl-dev \
	libmpc-dev \
	libffi-dev \
	libpython-dev \
	openssh-client \
	python-configparser \
	python-crypto \
	python-pyasn1 \
	python-gmpy2 \
	python-mysqldb \
	python-pip \
	python-twisted \
	python-zope.interface \
	virtualenv 

RUN sudo pip install configparser
RUN sudo pip install enum34
 
# Install cowrie
# RUN sudo apk add python py-asn1 py-twisted py-zope-interface libffi-dev py-cryptography py-pip py-six py-cffi py-idna py-ipaddress py-openssl

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
