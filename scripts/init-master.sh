#!/bin/bash
echo "Hi from Master!"
apt-get install ansible -y
mkdir -p /etc/ansible
cp /home/vagrant/.ansible/ansible.cfg /etc/ansible/ansible.cfg
apt-get install sshpass -y