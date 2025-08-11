#!/bin/bash
echo "nameserver 8.8.8.8" > /etc/resolv.confg
apt update -y
apt install vim -y