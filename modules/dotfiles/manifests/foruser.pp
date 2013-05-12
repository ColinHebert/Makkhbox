define dotfiles::forUser($ensure='present',
                        $repo = 'https://github.com/ColinHebert/dotfiles.git',
                        $branch = 'master') {
    $install_path = '~/.dotfiles'

    case $ensure {
        'present' : {

            exec {'dotfilesClone':
                command  => "git clone --recursive ${repo} ${install_path}",
                unless   => "test -e ${install_path}",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesRefresh':
                command  => "cd ${install_path} && git fetch --all",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesCheckout':
                command  => "cd ${install_path} && git checkout origin/${branch}",
                provider => 'shell',
                require  => Package['git'],
                user     => $name,
            }->
            exec {'dotfilesInstall':
                command  => "cd ${install_path} && ./install.rb",
                provider => 'shell',
                user     => $name,
            }
        }
        'absent' : {
            exec {'rmDotfilesLinks':
                # This will hopefully not break anything
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
