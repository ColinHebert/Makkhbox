class makkhbox::params {
    $packages = ['zsh', 'sudo']
    $users    = ['makkhdyn']
    $ssh_port = hiera('ssh_port')
}
