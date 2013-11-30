class nginx::install inherits nginx {
    ## Install nginx
    package { 'nginx':
        ensure => present,
    }
}
