#!/bin/bash

# Add Ansible PPA repository
sudo add-apt-repository -y ppa:ansible/ansible

# Update package lists
sudo apt-get update

# Install necessary packages
apt-get install -y software-properties-common python3-pip
pip3 install botocore boto3 ansible

# Install Ansible collections
ansible-galaxy collection install community.aws
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install newrelic.newrelic-infra
