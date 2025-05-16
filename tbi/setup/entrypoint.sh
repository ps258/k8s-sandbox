#!/bin/bash

PATH=/scripts:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

echo "Image starting: $1"

# setup hosts table entries at each startup since /etc/hosts seems to be overwritten
if [[ -n $SBX_HOST_ENTRIES ]]; then
	# setup any extra entries in /etc/hosts that are provided via $SBX_HOST_ENTRIES
	# The format is for it is # the format is 'ipaddress:alias:alias,next ipaddress:its alias:its other alias'
	# like this
	# SBX_HOST_ENTRIES=$SBX_HOST_IP_ADDR:httpbin.org:homebin.org,$SBX_DSHB_HOST:dbhost.home:anotherhost.home
	# this entry would go in your ~/.tyk-sandbox
	# Note that $SBX_HOST_IP_ADDR will be the IP address of the host running the sandbox not the ip address of the sandbox itself
	echo "### added during setup $0 ###" >> /etc/hosts
	for line in $(eval echo $SBX_HOST_ENTRIES | sed 's/,/ /g'); do  echo $line | sed 's/:/ /g' | \
		while read address names; do
			echo $address $names >> /etc/hosts
		done
	done
fi

echo "[INFO]Starting plugin server"
/setup/serve-plugins.sh >> /var/log/plugin-server.log 2>&1 &

echo "[INFO]Bastion host instance has started"
sleep infinity
