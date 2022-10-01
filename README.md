# Vagrant - Ansible playground

> Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past. (https://learn.hashicorp.com/tutorials/vagrant/getting-started-index?in=vagrant/getting-started)

> Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs. (https://www.ansible.com/overview/how-ansible-works)

<!-- [START usecases] -->

##### What can I do?

Most things that you can do manually in VirtualBox, in VMware Fusion and in Hyper-V can be done using Vagrant! Here are a few examples to get you started:

- Create one or more Virtual machines
- Define resources usage
- Configure VMs networks

Most installation and configuration tasks that you can do manually can be automated using Ansible! Here are a few examples to get you started:

- Install software
- Add new users
- Do TDD over infrastructure

<!-- [END usecases] -->

<!-- [START getstarted] -->

## Getting Started

### Requirements for this playground

- Windows 11
- WSL (Ubuntu 22.04)
- VirtualBox

### Installation

To use Vagrant in your project:

1. enable changing file owners and permissions in WSL:
   - create or edit file "/etc/wsl.conf"
   - add below config:
        ```bash
        [automount]
        options = "metadata"
        ```

2. install vagrant:
    ```bash
    # from Debian-based distributions
    sudo apt install vagrant
    ```

3. install virtualbox_WSL2 plugin:
     ```bash
    vagrant plugin install virtualbox_WSL2
    ```

4. install vagrant-hosts plugin
     ```bash
    vagrant plugin install vagrant-hosts
    ```

5. add below settings to your shell in WSL (.bashrc / .zshrc / etc..):
    ```bash
   # Vagrant
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
    export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Users/{your_user_name}"
    export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"   
    alias vup='vagrant up'
    alias vdf='vagrant destroy -f'
    alias vh='vagrant halt'
    ```
6. [Optional] install Vagrant autocomplete
    ```bash
    vagrant autocomplete install --bash --zsh
    ```
    
7. run Vagrantfile
    ```bash
    vagrant up
    ```

<!-- [END getstarted] -->