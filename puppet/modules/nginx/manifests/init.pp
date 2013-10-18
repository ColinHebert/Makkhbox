class nginx {
    $conf_dir = '/etc/nginx'

    package {'nginx':
        ensure => installed,
    }->
    service {'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true,
    }

    file {"${conf_dir}/nginx.conf":
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('nginx/nginx.conf.erb'),
        notify  => Service['nginx'],
        require => Package['nginx'],
    }

    # Custom conf directories
    file {["${conf_dir}/conf.d",
            "${conf_dir}/sites-available",
            "${conf_dir}/sites-enabled"]:
        ensure  => directory,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        require => Package['nginx'],
    }
  
    # Nuke default files
    file {"${conf_dir}/fastcgi_params":
        ensure  => absent,
        require => Package['nginx'],
    }
}
