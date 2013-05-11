define nginx::site($ensure='present', $content) {
    case $ensure {
        'present' : {
            file {"${nginx::conf_dir}/sites-available/${name}":
                ensure  => present,
                mode    => '0644',
                owner   => 'root',
                group   => 'root',
                content => $content,
                require => Package['nginx'],
            }->
            file {"${nginx::conf_dir}/sites-enabled/${name}":
                ensure  => link,
                target  => "${nginx::conf_dir}/sites-available/${name}",
                require => Package['nginx'],
                notify  => Service['nginx'],
            }
        }
        'absent' : {
            file {"${nginx::conf_dir}/sites-enabled/${name}":
                ensure => absent,
                notify  => Service['nginx'],
                require => Package['nginx'],
            }
        }
        default : {
            err ("Unknown ensure value: '$ensure'")
        }
    }
}
