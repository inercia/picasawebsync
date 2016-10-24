FROM python:2-alpine
MAINTAINER Alvaro Saurin <alvaro.saurin@suse.com>

RUN  apk add --update gcc linux-headers libc-dev tk-dev
RUN  pip install http://effbot.org/media/downloads/Imaging-1.1.6.tar.gz
RUN  pip install httplib2 oauth2client gdata

COPY     .  /src/app
WORKDIR  /src/app
RUN      python setup.py install

ENTRYPOINT ["/usr/local/bin/picasawebsync.py"]
