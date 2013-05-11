include nginx
include transmission

nginx::site {'transmission':
    ensure  => present,
    content => template('makkhbox/nginx/transmission.conf.erb'),
    require => Service['transmission']
}
