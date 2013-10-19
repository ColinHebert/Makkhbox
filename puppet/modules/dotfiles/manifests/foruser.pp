define dotfiles::forUser($ensure          = 'present',
                         $repository_url  = $dotfiles::params::repository_url,
                         $branch          = $dotfiles::params::branch_name,
                         $dotfiles_path   = $dotfiles::params::dotfiles_path) {
    #Validate arguments

    case $ensure {
        'present' : {
            exec {'dotfilesClone':
                command  => "git clone --recursive ${repo} ${dotfiles_path}",
                unless   => "test -e ${dotfiles_path}",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesRefresh':
                command  => "cd ${dotfiles_path} && git fetch --all",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesCheckout':
                command  => "cd ${dotfiles_path} && git checkout origin/${branch}",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesInstall':
                command  => "cd ${dotfiles_path} && ./install.rb",
                provider => 'shell',
                user     => $name,
            }
        }

        'absent' : {
            exec {'rmDotfilesLinks':
                # This will hopefully not break anything
                # based on dotfiles_path ?
                command  => 'find ~ -mindepth 1 -maxdepth 1 -type l -ilname "*\.dotfiles*" -exec rm \{\} \;',
                provider => 'shell',
                user     => $name,
            }
        }

        default : {
            err ("Unknown ensure value: '$ensure'")
        }
    }
}
