#!/usr/bin/env bash
set -euo pipefail

AZURE_IP="${AZURE_IP:-}"
ESXI_IP="${ESXI_IP:-}"

if [ -z "$AZURE_IP" ]; then
  AZURE_IP="$(terraform -chdir=/home/student/git/hybrid-cloud/terraform/azure output -raw azure_public_ip)"
fi

if [ -z "$ESXI_IP" ]; then
  ESXI_IP="$(terraform -chdir=/home/student/git/hybrid-cloud/terraform/esxi output -raw esxi_vm_ip)"
fi

printf '%s\n' \
  '[azure]' \
  "azure-vm ansible_host=${AZURE_IP}" \
  '' \
  '[esxi]' \
  "esxi-vm ansible_host=${ESXI_IP}" \
  '' \
  '[all:vars]' \
  'ansible_user=student' \
  'ansible_ssh_private_key_file=/home/student/.ssh/skylab' \
  'ansible_python_interpreter=/usr/bin/python3' \
  > ansible/inventory.ini

echo "Generated Ansible inventory:"
cat ansible/inventory.ini
