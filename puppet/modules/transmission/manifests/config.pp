class transmission::config inherits transmission {
    file { ["${conf_dir}",  "${conf_dir}/transmission-daemon"]:
        ensure  => directory,
        owner   => $service_user,
        group   => $service_group,
    }->
    file { "${conf_dir}/transmission-daemon/settings.json":
        ensure  => file,
        mode    => '0600',
        content => template("transmission/settings.json.erb"),
        owner   => $service_user,
        group   => $service_group,
        notify  => Service['transmission'],
    }
}
