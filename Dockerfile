#cdh repo key did not work at the time of writing this file: https://www.cloudera.com/documentation/enterprise/5-11-x/topics/cdh_ig_cdh5_install.html#topic_4_4_2
#hence the whole tarball
#FROM openjdk:8-jre-alpine3.7
FROM solr:7.2

ENV CDH_PARCEL http://archive.cloudera.com/cdh5/parcels/5.9.3/CDH-5.9.3-1.cdh5.9.3.p0.4-trusty.parcel

USER root
RUN mkdir /cdh
RUN wget -qO- $CDH_PARCEL | tar xz -C /cdh --strip 1
RUN chown solr /cdh -R
USER solr