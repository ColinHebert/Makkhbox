class dotfiles::install inherits dotfiles {
    ## Install dependencies
    package { $dependencies:
        ensure => installed,
    }
}
