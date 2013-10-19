class makkhbox::install inherit makkbox {
    ## Install transmission
    package { 'transmission':
        ensure => installed,
        name   => 'transmission-cli',
    }
}
