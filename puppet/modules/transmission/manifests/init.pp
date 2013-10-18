class transmission{
    $conf_dir = '/var/lib/transmission/.config/transmission-daemon'

    ## Install and start transmission
    package {'transmission':
        ensure => installed,
        name   => 'transmission-cli',
    }->
    service {'transmission':
        enable     => true,
        ensure     => running,
        hasrestart => true,
        name       => 'transmission',
        restart    => '/usr/bin/killall -HUP transmission-daemon',
    }

    file {["${conf_dir}/../", "${conf_dir}"]:
        ensure  => directory,
        owner   => 'transmission',
        group   => 'transmission',
        require => Package['transmission'],
    }->
    file {"${conf_dir}/settings.json":
        ensure  => file,
        mode    => '0644',
        content => template("transmission/settings.json.erb"),
        owner   => 'transmission',
        group   => 'transmission',
        notify  => Service['transmission'],
    }
}
