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
KEY_CLOAK_OPTS=
if [ "${TEST_MODE}" == "true" ]; then
    echo " ## Test mode detected ##"
    KEY_CLOAK_OPTS=-Dkeycloak.import=\${jboss.home.dir}/standalone/configuration/hawkular-realm-for-dev.json
fi

/opt/hawkular-live/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.server.data.dir=/var/hawkular/data \
   ${KEY_CLOAK_OPTS}
exit $?
