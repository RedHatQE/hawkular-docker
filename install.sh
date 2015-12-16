#!/bin/bash 
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
: ${JBOSS_BASE:=/opt/jboss}
. ${JBOSS_BASE}/build-env
unzip -qq -d ${JBOSS_BASE} ${JBOSS_BASE}/hawkular-dist.zip &&\
ln -s ${JBOSS_BASE}/hawkular-${HAWKULAR_VERSION} ${JBOSS_BASE}/hawkular-live &&\
chmod ug+x ${JBOSS_BASE}/hawkular-live/bin/*.sh &&\
rm -f ${JBOSS_BASE}/hawkular-dist.zip

exit $?
