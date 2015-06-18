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

FROM hawkular/docker-maven

MAINTAINER Viet Nguyen <vnguyen@redhat.com>

ENV REPO_URL=http://snapshots.jboss.org/maven2
ENV HAWKULAR_VERSION=1.0.0.Alpha2-SNAPSHOT
ENV ARTIFACT=org.hawkular:hawkular-dist:${HAWKULAR_VERSION}:zip

USER root

RUN cd /opt &&\
 mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get\
  -DremoteRepositories=${REPO_URL}\
  -Dartifact=${ARTIFACT}\
  -Dtransitive=false &&\
 mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy\
  -Dartifact="${ARTIFACT}"\
  -DoutputDirectory=.\
  -Dmdep.stripVersion=true\
  -Dmdep.stripClassifier=true &&\
 unzip -qq -d /opt /opt/hawkular-dist.zip;\
    rm -rf /opt/hawkular-dist.zip /root/.m2;\
    /opt/wildfly-8.2.0.Final/bin/add-user.sh hawkularadmin hawkularadmin --silent

EXPOSE 8080 9990

RUN printf "\
if  df | grep var/data;then\n\
  /opt/wildfly-8.2.0.Final/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.server.data.dir=/var/data\n\
else\n\
  /opt/wildfly-8.2.0.Final/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0\n\
fi\n\
" >> /root/start.sh
RUN chmod 755 /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]
