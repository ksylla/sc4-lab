FROM java:8

MAINTAINER Karl-Heinz Sylla <karl-heinz.sylla@iais.fraunhofer.de>

# disable debconf frontend warnings
ENV DEBIAN_FRONTEND noninteractive

# Install utilities
RUN apt-get update && apt-get install -y apt-utils vim
RUN apt-get update && apt-get install -y supervisor dnsutils

# Download-site and versions to be used
ENV ZK_VERSION zookeeper-3.4.8

# Download distribution
RUN wget -q http://ftp.halifax.rwth-aachen.de/apache/zookeeper/"$ZK_VERSION"/"$ZK_VERSION".tar.gz -O /tmp/"$ZK_VERSION".tar.gz \
    && tar xfz /tmp/"$ZK_VERSION".tar.gz -C /opt \
    && rm /tmp/"$ZK_VERSION".tar.gz

# The common installation dirname to use zookeeper
RUN ln -s /opt/"$ZK_VERSION" /opt/zookeeper

# Define the run configuration
RUN cd /opt/zookeeper/conf \
    && cp -p zoo_sample.cfg zoo.cfg

COPY zookeeper-startup.sh /

#CMD [ "/opt/zookeeper/bin/zkServer.sh", "start-foreground" ]
CMD [ "./zookeeper-startup.sh" ]
