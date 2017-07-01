#!/bin/bash

csr_request_count=`kubectl get csr|grep -i pending|wc -l`
echo $csr_request_count

while [ $csr_request_count -gt 0 ];do
  for i in `kubectl get csr |grep -i pending|awk '{print $1}'`;do kubectl certificate approve $i;done
exit
done
