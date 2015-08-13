# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "base1"
   config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

   config.vm.box_url = "https://dl.dropboxusercontent.com/u/106166982/vagrant_centos7-v1.0.box"

   config.vm.network :private_network, ip: "192.168.33.10"
   config.vm.hostname = "puppet.dev.com"
   config.ssh.forward_agent = true

end
