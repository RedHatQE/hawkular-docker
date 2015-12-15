#
# Copyright 2015 Red Hat, Inc. and/or its affiliates
# and other contributors as indicated by the @author tags.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Dockerfile for hawkular-kettle

FROM jboss/base-jdk:8

ENV HAWKULAR_HOME=/opt/jboss/hawkular-live
ENV JBOSS_BASE=/opt/jboss

WORKDIR ${JBOSS_BASE}

ADD build-env ./
ADD output/hawkular-dist.zip ./
ADD install.sh ${JBOSS_BASE}/hawkular-install.sh
ADD start.sh ${JBOSS_BASE}/hawkular-start.sh
ADD agent.xsl ./

RUN ${JBOSS_BASE}/hawkular-install.sh 

USER root
RUN mkdir /data &&\
    chown -R jboss:jboss /data
USER jboss
VOLUME /data

EXPOSE 8080

CMD ["/bin/bash", "-c", "${JBOSS_BASE}/hawkular-start.sh"]
