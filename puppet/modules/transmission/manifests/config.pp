class transmission::config {
    require transmission::install

    file {["${transmission::params::conf_dir}/../", "${transmission::params::conf_dir}"]:
        ensure  => directory,
        owner   => $transmission::params::user,
        group   => $transmission::params::group,
        require => Package['transmission'],
    }->
    file {"${transmission::params::conf_dir}/settings.json":
        ensure  => file,
        mode    => '0644',
        content => template("transmission/settings.json.erb"),
        owner   => $transmission::params::user,
        group   => $transmission::params::group,
        notify  => Service['transmission'],
    }
}
