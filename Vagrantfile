Vagrant.configure("2") do |config|
    config.ssh.shell = "/bin/zsh -l"
    config.vm.box = "Arch_Linux_2013.03_x64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    #config.vm.box_url = "http://vagrant.pouss.in/archlinux_2012-07-02.box"

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :forwarded_port, guest: 5432, host: 5432
    config.vm.network :forwarded_port, guest: 2222, host: 5331
    config.vm.network :forwarded_port, guest: 9091, host: 9091

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "1"]
    end

    config.vm.provision :puppet do |puppet|
        puppet.module_path    = "puppet/modules"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "makkhbox.pp"
        puppet.options        = "--verbose --debug"
    end
end
