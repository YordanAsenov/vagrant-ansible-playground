#!/bin/bash
echo "Start init-master"
apt install software-properties-common -y
add-apt-repository --yes --update ppa:ansible/ansible  -y
add-apt-repository ppa:ansible/ansible -y
apt update -y
apt install ansible-core -y
apt autoremove -y

mkdir -p /etc/ansible
cp /home/vagrant/.ansible/ansible.cfg /etc/ansible/ansible.cfg
apt-get install sshpass -y
echo "End init-master"