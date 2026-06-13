#!/usr/bin/env bash
set -euo pipefail

AZURE_IP="$(terraform -chdir=terraform/azure output -raw azure_public_ip)"
ESXI_IP="$(terraform -chdir=terraform/esxi output -raw esxi_vm_ip)"

cat > ansible/inventory.ini <<EOF
[azure]
azure-vm ansible_host=${AZURE_IP}

[esxi]
esxi-vm ansible_host=${ESXI_IP}

[all:vars]
ansible_user=student
ansible_ssh_private_key_file=/home/student/.ssh/skylab
ansible_python_interpreter=/usr/bin/python3
EOF

echo "Generated Ansible inventory:"
cat ansible/inventory.ini
