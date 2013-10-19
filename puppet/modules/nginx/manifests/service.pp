class nginx::service inherits nginx {
    service {'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true,
    }
}
