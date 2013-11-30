define nginx::site(
    $ensure  = 'present',
    $content = undef,
    $source  = undef
) {

    if ! defined(Class['nginx']) {
        fail('You must include the nginx base class before using any nginx defined resources')
    }

    validate_re($ensure, '^(present|absent)$',
        "${ensure} is not supported for ensure.
        Allowed values are 'present' and 'absent'.")

    case $ensure {
        'present' : {
            file {"${nginx::conf_dir}/sites-available/${name}.conf":
                ensure  => present,
                mode    => '0644',
                owner   => 'root',
                group   => 'root',
                source  => $source,
                content => $content,
                require => Package['nginx'],
            }->
            file {"${nginx::conf_dir}/sites-enabled/${name}.conf":
                ensure  => link,
                target  => "${nginx::conf_dir}/sites-available/${name}.conf",
                require => Package['nginx'],
                notify  => Service['nginx'],
            }
        }

        'absent' : {
            file {"${nginx::conf_dir}/sites-enabled/${name}.conf":
                ensure => absent,
                require => Package['nginx'],
                notify  => Service['nginx'],
            }
        }
    }
}
