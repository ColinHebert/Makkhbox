class transmission::install inherits transmission {
    ## Install transmission
    package { 'transmission':
        ensure => installed,
        name   => 'transmission-cli',
    }
}
