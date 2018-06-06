# ceph-container-utils
Ceph-container with some utilities baked right in ;)

## Usage
This container contains two extra scripts:
  * `/location.sh`, a simple CRUSH location hook for GKE. Activate it by putting `crush_location_hook=/location.sh` in your ceph.conf and set `CLUSTER_NAME` to the name of your cluster. Each node will now be in a rack named after the node group.
  * `/mon-preflight-check.sh`, a wrapper script for mon startups. If you use a persistent storage for your monitors, this script checks whether the current IP and the IP of the last monitor using that directory match. If not, it is renamed so that ceph-container will create a new monitor. To use, set the entrypoint of your container to this script.
