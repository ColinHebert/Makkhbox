class makkhbox::config inherits makkhbox {
#    ## Root settings
#    user { 'root':
#        shell => '/bin/zsh',
#        require => Package['zsh']
#    }->
#    dotfiles::forUser { 'root':
#        ensure => present,
#        branch  => 'makkhbox',
#    }
#
#    ## Custom users
#    user { $users:
#        shell => '/bin/zsh',
#        managehome => true,
#        ensure => present,
#        groups => ['transmission', 'wheel'],
#        require => Package['zsh', 'transmission'],
#    }->
#    dotfiles::forUser { $users:
#        ensure  => present,
#        branch  => 'makkhbox',
#    }
#
#    $users.each | $user | {
#        ssh_authorized_key { 'ssh-key':
#            ensure => present,
#            key    => strip(hiera('Colin-Hebert.pub'))
#        }
#    }
}
