class nginx::install inherits nginx {
    ## Install nginx
    # Workaround an issue with yaourt/pacman, puppet and charset
    exec { "pacman --noconfirm -S nginx":
      require => Exec['pacman -Sy'],
    }->
    package { 'nginx':
        ensure => present,
    }
}
