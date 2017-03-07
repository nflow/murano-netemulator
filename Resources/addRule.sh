#!/bin/bash
device=$(route | grep default | awk '{print $(NF)}' | head -n 1)
tc class add dev $device parent 1: classid 1:%ID% htb rate %BANDWIDTH%
tc qdisc add dev $device parent 1:%ID% handle %ID%0: netem delay %DELAY% %JITTER% distribution normal loss %LOSS%
tc filter add dev $device protocol ip prio 1 u32 match ip dst %DST_IP% flowid 1:%ID%