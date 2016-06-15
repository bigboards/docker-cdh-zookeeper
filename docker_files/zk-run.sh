#!/bin/bash
if [ $(ls /var/lib/zookeeper | wc -l) = "0" ]; then
	su -s /bin/bash zookeeper -c "zookeeper-server-initialize $*"
fi

su -s /bin/bash zookeeper -c "/usr/bin/zookeeper-server start-foreground"
