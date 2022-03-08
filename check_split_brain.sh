#!/bin/sh
vip=192.168.16.100
node1_ip=192.168.16.101
while true;do
	ping -c 2 $node1_ip &>/dev/null
	if [$? -eq 0 -a `ip add|grep "$vip"|wc -l` -eq 1];then
		echo "ha is split brain.warning"
		systemctl stop keepalived
	else
		echo "ha is ok"
	fi
sleep 5
done