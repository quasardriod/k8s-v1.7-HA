#!/bin/bash

if ip a s ens3 |grep -i {{k8s_lb_vip}}; then
  if ! /var/run/haproxy.pid; then
    echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: VIP is up, HAproxy is down. Starting HAproxy." >> /var/log/keepalived-notifications.log
    systemctl start haproxy

  fi
fi
