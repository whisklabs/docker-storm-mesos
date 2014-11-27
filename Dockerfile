FROM mesosphere/mesos:0.20.1-1.0.ubuntu1404
MAINTAINER Viktor Taranenko "viktortnk@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python wget supervisor

RUN wget -q -N http://dl.bintray.com/whisklabs/generic/storm-mesos-0.9.3.tgz && \
 tar xzf ./storm-mesos-0.9.3.tgz && \
 mv ./storm-mesos-0.9.3 /storm-mesos && \
 chmod +x /storm-mesos/bin/storm && \
 rm ./storm-mesos-0.9.3.tgz

ENV STORM_CONFIG /storm-mesos/conf/storm.yaml

VOLUME ["/usr/local/storm-local"]

ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["supervisord"]