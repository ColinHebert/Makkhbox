class nginx::config inherits nginx {
        file {"${conf_dir}/nginx.conf":
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('nginx/nginx.conf.erb'),
        notify  => Service['nginx'],
    }

    # Custom conf directories
    file {["${conf_dir}/conf.d",
            "${conf_dir}/sites-available",
            "${conf_dir}/sites-enabled"]:
        ensure  => directory,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
    }

    # Remove default files
    file {"${conf_dir}/fastcgi_params":
        ensure  => absent,
    }

}


