
box      = 'ubuntu/trusty64'
hostname = 'h{{project_name}}'
domain   = 'example.com'
# ip       = '192.168.1.222'
ram      = '512'
cpus     = '1'
nictype  = 'virtio'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = box
  config.vm.hostname = hostname
  # config.vm.network "private_network", ip: ip

  # config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  # config.vm.provision :shell, path: ".provision/provision.sh"

  config.vm.provider :virtualbox do |vb|
    #  vb.gui = true
    vb.name = hostname
    vb.customize ["modifyvm", :id, "--memory", ram]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
    vb.customize ["modifyvm", :id, "--nictype1", nictype]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", 'on']
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = 'v'
    ansible.playbook = "ansible/vagrant.yml"
  end

end
