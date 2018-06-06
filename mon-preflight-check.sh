#!/bin/bash

cd /var/lib/ceph/mon
ID="$(echo ce* | sed 's/^ceph-//g')"
if [ -d "/var/lib/ceph/mon/ceph-$ID" ] ; then
	ceph-mon -i $ID --extract-monmap /tmp/monmap
	MONIP=$(monmaptool --print /tmp/monmap | grep mon.$ID | awk '{print $2}' | awk -F: '{print $1}')
	MYIP=$(ip addr show dev eth0 | grep "inet " | awk '{print $2}' | awk -F/ '{print $1}')

	echo "#########################################################################"
	echo "################ Starting monitor $ID ################"
	echo "############ My IP: $MYIP, monitor's last IP: $MONIP ############"
	echo "#########################################################################"

	if [ "$MYIP" != "$MONIP" ] ; then
		echo "WARNING: IPs do not match, moving the old monitor directory!!"
		mv "ceph-$ID" "OLD-$IP-$ID"
	fi
fi

/entrypoint.sh
