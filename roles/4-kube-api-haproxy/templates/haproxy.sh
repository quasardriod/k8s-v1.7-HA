#!/bin/bash

if ! ip a s ens3 |grep -i {{k8s_lb_vip}}; then
  count=`ping -c 5 {{k8s_lb_vip}}|grep -i packets|awk '{print $4}'`
  if ${count} == 5;then
    echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: VIP is up in another master node." >> /var/log/keepalived-notifications.log
    if ls /var/run/haproxy.pid 1> /dev/null 2>&1; then
      echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: HAproxy pid exists, haproxy must be stopped." >> /var/log/keepalived-notifications.log
      systemctl stop haproxy;
      sleep 2;
      if ls /var/run/haproxy.pid 1> /dev/null 2>&1; then
        echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: HAproxy failed to stop, killng haproxy." >> /var/log/keepalived-notifications.log
        ps -ef |grep -i haproxy|awk 'FNR==1 {print "kill -9 "$2}'|sh;
      fi
    else
      echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: HAproxy not running, as it should. Because VIP is down. No action required." >> /var/log/keepalived-notifications.log
    fi
fi
