class makkhbox::params {
    $packages = ['zsh', 'sudo']
    $users    = hiera_array('users')
    $ssh_port = hiera('ssh_port')
}
