
Vagrant.configure("2") do |config|
    # Installs puppet and GPG (for hieraGPG)
    config.vm.provision :shell, :path => "bootstrap.sh"
    config.vm.provision :puppet do |puppet|
        puppet.module_path       = 'puppet/modules'
        puppet.manifests_path    = 'puppet/manifests'
        puppet.manifest_file     = 'makkhbox.pp'
        puppet.hiera_config_path = 'puppet/hiera.yaml'
        puppet.working_directory = '/vagrant/puppet'
        puppet.facter['env']     = 'dev'
        #puppet.options           = '--verbose --debug'
    end

    # MakkhBox
    config.vm.define :makkhbox, primary: true do |makkhbox|
        makkhbox.vm.provider :virtualbox do |vb, override|
            override.vm.box = "Arch_Linux_2013.08_x64"

            # Create a forwarded port mapping which allows access to a specific port
            # within the machine from a port on the host machine. In the example below,
            # accessing "localhost:8080" will access port 80 on the guest machine.
            override.vm.network :forwarded_port, guest: 80, host: 8080
            override.vm.network :forwarded_port, guest: 22, host: 5331
            override.vm.network :forwarded_port, guest: 9091, host: 9091

            vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1"]
        end
    end

    # Raspberry Pi Media Center
    config.vm.define :makkhpi do |makkhpi|
        #TODO: QEMU/libvirt configuration
        #makkhpi.vm.provider :kvm do |kvm, override|
        #    kvm.qemu_bin = "qemu-system-arm"
        #end
    end

    # Configuration to provision production environment from Vagrant
    config.vm.provider :managed do |managed, override|
        managed.server              = config.custom.hostname
        override.vm.box             = "dummy"
        override.vm.box_url         = "https://github.com/tknerr/vagrant-managed-servers/raw/master/dummy.box"
    end
end
