Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
exec {'pacman -Sy ':}->Package <| |>

include nginx
include transmission
include dotfiles

nginx::site {'transmission':
    ensure  => present,
    content => template('makkhbox/nginx/transmission.conf.erb'),
    require => Service['transmission']
}
