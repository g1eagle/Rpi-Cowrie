FROM resin/rpi-raspbian
MAINTAINER Gomasy <nyan@gomasy.jp>

# Upgrade and install required packages
RUN sed -ie "s/archive.raspbian.org/ftp.jaist.ac.jp\/pub\/Linux\/raspbian-archive/g" /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y python-mysqldb git && apt-get clean
RUN apt-get install git python-dev python-openssl openssh-server python-pyasn1 python-twisted authbind



# Install cowrie
RUN useradd -d /opt/cowrie -s /usr/sbin/nologin cowrie
RUN git clone https://github.com/micheloosterhof/cowrie.git /opt/cowrie
RUN cd /opt/cowrie && cp cowrie.cfg.dist cowrie.cfg
RUN chown -R cowrie. /opt/cowrie

USER cowrie
WORKDIR /opt/cowrie
CMD ["twistd", "--nodaemon", "-y", "cowrie.tac", "-l", "log/cowrie.log", "--pidfile=cowrie.pid"]

CMD ./start.sh