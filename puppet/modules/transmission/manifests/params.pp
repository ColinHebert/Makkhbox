class transmission::params {
    $user  = 'transmission',
    $group = 'transmission',

    $rpc_user     = hiera('rpc_user'),
    $rpc_password = hiera('rpc_password'),

    $blocklist_url = hiera('blocklist_url'),

    $conf_dir = '/var/lib/transmission/.config/transmission-daemon',
}
