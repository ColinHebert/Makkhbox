class transmission::service inherits transmission {
    service { 'transmission':
        name       => 'transmission',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        restart    => '/usr/bin/killall -HUP transmission-daemon',
    }
}
