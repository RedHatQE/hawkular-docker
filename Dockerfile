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

USER root
WORKDIR /opt

ADD build-env /etc/build-env
ADD output/hawkular-dist.zip /opt/
ADD install.sh /usr/bin/hawkular-install.sh
ADD start.sh /usr/bin/hawkular-start.sh

RUN /usr/bin/hawkular-install.sh

EXPOSE 8080

CMD ["/bin/bash", "/usr/bin/hawkular-start.sh"]
