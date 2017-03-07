#!/bin/bash
device=$(route | grep default | awk '{print $(NF)}' | head -n 1)
tc qdisc del dev $device root
tc qdisc add dev $device root handle 1: htb