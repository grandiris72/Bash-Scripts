#!/bin/bash

# Add Ansible PPA repository
add-apt-repository -y ppa:ansible/ansible

# Update package lists
sudo apt-get update

# Install necessary packages
apt-get install -y software-properties-common python3-pip
pip3 install botocore boto3 ansible

# Install Ansible collections
ansible-galaxy collection install community.aws
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install newrelic.newrelic-infra

wget https://raw.githubusercontent.com/grandiris72/ansible-playbooks/main/createawsec2instance.yml
wget https://raw.githubusercontent.com/grandiris72/ansible-playbooks/main/aws_ec2.yaml

echo replacing ansible config
cd /etc/ansible
sudo rm -rf ansible.cfg
wget https://raw.githubusercontent.com/grandiris72/ansible-playbooks/main/ansible.cfg
cd
