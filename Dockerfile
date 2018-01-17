FROM solr:6.5

USER root

#invalid repos on CLoduera's site
#RUN wget "https://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/cloudera.list" -O /etc/apt/sources.list.d/cloudera.list
RUN printf "deb http://archive.cloudera.com/cdh5/debian/jessie/amd64/cdh jessie-cdh5.9.0 contrib" >> /etc/apt/sources.list.d/cloudera.list
RUN printf "deb-src http://archive.cloudera.com/cdh5/debian/jessie/amd64/cdh jessie-cdh5.9.0 contrib" >> /etc/apt/sources.list.d/cloudera.list
#RUN apt-key adv  --keyserver pgp.mit.edu --recv 02A818DD
RUN apt-get update

RUN printf "Package: * \nPin: release o=Cloudera, l=Cloudera \nPin-Priority: 501" > /etc/apt/preferences.d/cloudera.pref
#RUN wget https://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/archive.key -O archive.key && apt-key add archive.key

RUN wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u7_amd64.deb
RUN dpkg -i libssl1.0.0_1.0.1t-1+deb8u7_amd64.deb
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install --allow-unauthenticated -y parquet hadoop-mapreduce hadoop-client hadoop hadoop-0.20-mapreduce libssl1.0.2 hbase-solr

USER solr