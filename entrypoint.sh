#!/bin/bash
sleep 3
update-alternatives --set iptables /usr/sbin/iptables-legacy
sleep 5
service fail2ban restart