class dotfiles::params {
    $repository_url = 'https://github.com/ColinHebert/dotfiles.git'
    $branch_name    = 'master'
    $dotfiles_path  = '~/.dotfiles'
    $dependencies   = ['git', 'tmux', 'zsh']
}
