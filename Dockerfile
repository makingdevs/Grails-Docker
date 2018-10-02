FROM java:8
MAINTAINER Jorge Acosta Lemus <jorge@makingdevs.com>

ARG GRAILS_VERSION=3.2.11

WORKDIR /usr/lib/jvm

ADD https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip /usr/lib/jvm/grails-$GRAILS_VERSION.zip
RUN unzip grails-$GRAILS_VERSION.zip
RUN rm -rf grails-$GRAILS_VERSION.zip
RUN ln -s grails-$GRAILS_VERSION grails

ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

RUN mkdir /app

WORKDIR /app

ENTRYPOINT ["grails"]