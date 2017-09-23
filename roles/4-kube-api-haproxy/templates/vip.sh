#!/bin/bash

if ip a s {{lb_eth_name}} |grep -i {{k8s_lb_vip}}; then
  echo "`date "+%Y-%m-%d %H:%M:%S"`: IP is up. Start haproxy service." >> /var/log/keepalived-notifications.log
  systemctl start haproxy
#else
#  echo "`date "+%Y-%m-%d %H:%M:%S"`: IP is down. Stop haproxy service." >> /var/log/keepalived-notifications.log
#  systemctl stop haproxy
fi
#TYPE=$1
#NAME=$2
#NOW=`date "+%Y-%m-%d %H:%M:%S"`
#NEWSTATE=$3
#OLDSTATE=$(cat /var/run/keepalived.state)
#
#echo "$NEWSTATE" > /var/run/keepalived.state
#
#case $NEWSTATE in
#        "FAULT") echo "$NOW Trying to restart haproxy to get out"\
#                  "of faulty state" >> /var/log/keepalived-notifications.log
#                 /etc/init.d/haproxy stop
#                 /etc/init.d/haproxy start
#                 exit 0
#                 ;;
#        *) echo "$NOW Unknown state" >> /var/log/keepalived-notifications.log
#           exit 1
#           ;;
#esac
