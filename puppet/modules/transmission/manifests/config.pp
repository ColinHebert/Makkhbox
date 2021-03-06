class transmission::config inherits transmission {
    file { $conf_dir:
        ensure  => directory,
        owner   => $service_user,
        group   => $service_group,
        source  => 'puppet:///modules/transmission/var/lib/transmission/.config',
        recurse => true,
        ignore  => '.gitignore',
    }->
    file { "${conf_dir}/transmission-daemon/settings.json":
        ensure  => file,
        mode    => '0600',
        content => template("transmission/transmission-daemon/settings.json.erb"),
        owner   => $service_user,
        group   => $service_group,
        notify  => Service['transmission'],
    }
}
