class transmission::install {
    ## Install and start transmission
    package {'transmission':
        ensure => installed,
        name   => 'transmission-cli',
    }
}
