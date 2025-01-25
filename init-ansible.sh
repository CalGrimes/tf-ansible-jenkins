#! /bin/bash
export PUBLIC_IP=$(terraform output -raw public_ip)

echo $PUBLIC_IP

cd ..

sed "s|<host_ip>|$PUBLIC_IP|g" ansible/inventory

pip3 install --user ansible

cat ansible/inventory

cd ansible && ansible-playbook --private-key /tmp/private_key.pem -i inventory jenkinsPlaybook.yaml