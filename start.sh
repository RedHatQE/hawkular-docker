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
if [ "${TEST_MODE}" == "true" ]; then
    echo " ## Test mode detected ##"
    CONFIG_DIR=/opt/hawkular-live/standalone/configuration
    cp -b $CONFIG_DIR/hawkular-realm-for-dev.json $CONFIG_DIR/hawkular-realm.json 
fi

STORAGE_OPTS=

if [ ! -z ${STORAGE_NODES} ]; then
   echo " ## Using external storage nodes ##"
   STORAGE_OPTS="-Dhawkular-metrics.cassandra-nodes=\"${STORAGE_NODES}\" -Dhawkular-metrics.backend=remote"
fi

/opt/hawkular-live/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 \
  -Djboss.server.data.dir=/var/hawkular/data \
  ${STORAGE_OPTS}

exit $?
