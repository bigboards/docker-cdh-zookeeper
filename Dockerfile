# Pull base image.
#FROM bigboards/cdh-base-__arch__
FROM bigboards/cdh-base-x86_64

MAINTAINER bigboards
USER root 

RUN apt-get update && apt-get install -y zookeeper zookeeper-server

RUN mkdir /var/run/zookeeper && \
    chown zookeeper /var/run/zookeeper

ADD docker_files/zk-run.sh /apps/zk-run.sh
RUN chmod a+x /apps/zk-run.sh

# internal ports
EXPOSE 2888 3888 3181 4181 8019 9010

# external ports
EXPOSE 2181 

CMD ["/apps/zk-run.sh"]
