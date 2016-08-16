FROM ubuntu:trusty
MAINTAINER Louis DeLosSantos (louis@jwplayer.com)

ENV CONSUL_DC=local-us
ENV CONSUL_BOOTSTRAP_EXPECT=0
ENV CONSUL_BIND=0.0.0.0
ENV CONSUL_CLIENT=0.0.0.0
ENV CONSUL_DATA_DIR=/etc/consul
ENV CONSUL_LOG_LEVEL=INFO
ENV CONSUL_SERVER=false
ENV CONSUL_SYSLOG=false
ENV CONSUL_UI=true
ENV CONSUL_JOIN=[]
ENV CONSUL_ACL_DATACENTER=local-us
ENV CONSUL_DEFAULT_POLICY=deny
ENV CONSUL_MASTER_TOKEN=CDCBF508-AA31-41D5-89E8-27391196CC1E

COPY run.sh /usr/local/bin/run.sh
COPY template.sh /tmp

RUN \
  echo Installing dependencies... && \
  apt-get update && \
  apt-get install -y unzip curl && \
  cd /tmp/ && \
  curl https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -o consul.zip && \
  mkdir /opt/consul && \
  mkdir /etc/consul.d/ && \
  echo Installing Consul... && \
  unzip consul.zip && \
  chmod +x consul && \
  chmod +x /usr/local/bin/run.sh && \ 
  mv consul /opt/consul/consul


CMD ["/usr/local/bin/run.sh"]
