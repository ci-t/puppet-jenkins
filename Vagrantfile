# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "base"
   config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

   config.vm.box_url = "/home/rmoyano/vagrantbox/CentOS-7.1.1503-x86_64-netboot.box"

   config.vm.network :private_network, ip: "192.168.33.10"
   config.vm.hostname = "puppet.dev.com"
   config.ssh.forward_agent = true

end
