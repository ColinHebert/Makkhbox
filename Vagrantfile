module CustomConfiguration
    class Config < Vagrant.plugin("2", :config)
        attr_accessor :hiera
    end

    class Plugin < Vagrant.plugin("2")
        name 'Custom configuration variables plugin'

        config 'custom'  do
            Config
        end
    end
end

Vagrant.configure("2") do |config|
    config.ssh.shell = "/bin/zsh -l"
    config.custom.hiera = "hiera.yaml"

    config.vm.provider :virtualbox do |vb, override|
        override.vm.box = "Arch_Linux_2013.08_x64"
        override.custom.hiera = "hiera-dev.yaml"

        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine. In the example below,
        # accessing "localhost:8080" will access port 80 on the guest machine.
        override.vm.network :forwarded_port, guest: 80, host: 8080
        override.vm.network :forwarded_port, guest: 2222, host: 5331
        override.vm.network :forwarded_port, guest: 9091, host: 9091

        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1"]
    end

    config.vm.provider :managed do |managed, override|
        override.vm.box = "dummy"
        managed.server = "makkhbox"
    end

    config.vm.provision :shell, :path => "bootstrap.sh"

    config.vm.provision :puppet do |puppet|
        puppet.module_path    = "puppet/modules"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "makkhbox.pp"
        puppet.options        = "--verbose --debug --hiera_config /vagrant/puppet/#{config.custom.hiera}"
    end
end
