include nginx
include transmission
include dotfiles

nginx::site {'transmission':
    ensure  => present,
    content => template('makkhbox/nginx/transmission.conf.erb'),
    require => Service['transmission']
}
