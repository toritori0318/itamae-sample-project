# -*- mode: ruby -*-
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # vm
  config.vm.define :vm_app do |vm_app|
    vm_app.vm.box = "vagrant-centos-65-x86_64-minimal"
    vm_app.vm.box_url = "http://files.brianbirkinbine.com/vagrant-centos-65-x86_64-minimal.box"
    #vm_app.vm.network :private_network, ip: "192.168.53.11"
  end

  # provision
  config.vm.provision "shell" do |s|
      s.path   = "vagrant_provision.sh"
      s.inline = $script
  end

end
