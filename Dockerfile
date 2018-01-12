#FROM openjdk:8-jre-alpine3.7
FROM solr:7.2

ENV CDH_PARCEL http://archive.cloudera.com/cdh5/parcels/5.9.3/CDH-5.9.3-1.cdh5.9.3.p0.4-trusty.parcel

RUN mkdir /cdh
RUN wget -qO- $CDH_PARCEL | tar xz -C /cdh --strip 1

WORKDIR /cdh