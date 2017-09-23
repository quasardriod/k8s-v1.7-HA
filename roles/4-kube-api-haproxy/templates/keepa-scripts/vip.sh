#!/bin/bash

# start haproxy service after bring up LB VIP
if ip a s ens3 |grep -i {{k8s_lb_vip}}; then
  echo "`hostname date "+%Y-%m-%d %H:%M:%S"`: IP is up. Start haproxy service." >> /var/log/keepalived-notifications.log
  systemctl start haproxy
fi
