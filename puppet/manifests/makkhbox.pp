Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
exec {'pacman -Sy ':}->Package <| |>

include nginx
include transmission
include dotfiles

## Set up default site in nginx
nginx::site {'default':
    ensure  => present,
    content => template('makkhbox/nginx/default.conf.erb'),
}

## Set up transmission in nginx
nginx::site {'transmission':
    ensure  => present,
    content => template('makkhbox/nginx/transmission.conf.erb'),
    require => Service['transmission']
}

## Root settings
user {'root':
    shell => '/bin/zsh',
    require => Package['zsh']
}->
dotfiles::forUser {'root':
    ensure => present,
    branch  => 'makkhbox',
}

## Custom user
user {'makkhdyn':
    shell => '/bin/zsh',
    managehome => true,
    ensure => present,
    groups => ['transmission', 'wheel'],
    require => Package['zsh', 'transmission'],
}->
dotfiles::forUser {'makkhdyn':
    ensure  => present,
    branch  => 'makkhbox',
}
