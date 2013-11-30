define nginx::site($ensure='present', $content) {
    case $ensure {
        'present' : {
            file {"${conf_dir}/sites-available/${name}":
                ensure  => present,
                mode    => '0644',
                owner   => 'root',
                group   => 'root',
                content => $content,
                require => Package['nginx'],
            }->
            file {"${conf_dir}/sites-enabled/${name}":
                ensure  => link,
                target  => "${nginx::conf_dir}/sites-available/${name}",
                require => Package['nginx'],
                notify  => Service['nginx'],
            }
        }

        'absent' : {
            file {"${conf_dir}/sites-enabled/${name}":
                ensure => absent,
                require => Package['nginx'],
                notify  => Service['nginx'],
            }
        }
        default : {
            err ("Unknown ensure value: '$ensure'")
        }
    }
}
