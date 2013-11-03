class nginx::config inherits nginx {
    file {"${conf_dir}":
        ensure  => directory,
        owner   => 'root',
        mode    => '0644',
        group   => 'root',
        source  => 'puppet:///modules/nginx/etc/nginx',
        recurse => true,
        notify  => Service['nginx'],
    }

    # Remove default files
    file {"${conf_dir}/fastcgi_params":
        ensure  => absent,
    }
}
