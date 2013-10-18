class dotfiles{
    package {'git':
        ensure => installed
    }
    package {'tmux':
        ensure => installed
    }
    package {'zsh':
        ensure => installed
    }
}
