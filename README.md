## Hawkular
Hawkular is an open source system monitoring suite.  You can learn more about the project here: http://www.hawkular.org

## Usage 
Simple all-in-one mode:

```docker run -d -p 8080:8080  hawkular/hawkular```

With external Cassandra storage
```
# Launch Cassandra storage node in Docker
# docker run --name cassandra -d cassandra:2.2 \
  bash -c "sed -i 's/^start_rpc.*$/start_rpc: true/' /etc/cassandra/cassandra.yaml; /docker-entrypoint.sh -f"

# Now tell Hawkular to use the above Cassandra node
# docker run --name hawkular --link cassandra -e CASSANDRA_NODES=cassandra -e TEST_MODE=true -dP hawkular/hawkular
```
Optional environment variables

* ```TEST_MODE=true``` enable test account (id=jdoe, password=password)
* ```CASSANDRA_NODES=<cassandra storage host/ip>``` use external storage node

Debug and troubleshooting - overriding the container default startup script with ```/bin/bash``` to get inside the container

```docker run -d -p 8080:8080 hawkular/hawkular /bin/bash```
