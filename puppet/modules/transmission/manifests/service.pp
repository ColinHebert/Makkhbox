class transmission::service {
    require transmission:config

    service {'transmission':
        name       => 'transmission',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        restart    => '/usr/bin/killall -HUP transmission-daemon',
        require    => Class['transmission::config']
    }
}
