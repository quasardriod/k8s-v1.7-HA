#!/bin/bash
echo "local_user: $USER" > local_user.yaml
ansible-playbook -i user-setup-inventory.yaml user-setup.yaml
rm -rf local_user.yaml
ansible-playbook -i k8s-inventory.yaml deploy.yaml
