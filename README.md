## Hawkular
Hawkular is an open source system monitoring suite.  You can learn more about the project here: http://www.hawkular.org

## Usage 
```docker run -d -p 8080:8080  hawkular/hawkular```

Optional environment variables

* ```TEST_MODE=true``` enable test account (id=jdoe, password=password)
* ```CASSANDRA_NODES=<cassandra storage host/ip>``` use external storage node

External Cassandra storage example
```
# Launch Cassandra storage node in Docker
docker run -d --name cassandra cassandra:2.1

# Now tell Hawkular to use the above Cassandra node
docker run -d --link cassandra:cassandra -e CASSANDRA_NODES=cassandra -e TEST_MODE=true hawkular/hawkular
```

Debug and troubleshooting - overriding the container default startup script with ```/bin/bash``` to get inside the container

```docker run -d -p 8080:8080 hawkular/hawkular /bin/bash```
