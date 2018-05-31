#!/bin/bash

if [ -z "${CLUSTER_NAME}" ] ; then
	export CLUSTER_NAME='cluster-1'
fi

echo "root=default rack=$(hostname | sed -E "s/gke-${CLUSTER_NAME}-(.*)-[a-z0-9]+-[a-z0-9]+/\1/g") host=$(hostname)"
