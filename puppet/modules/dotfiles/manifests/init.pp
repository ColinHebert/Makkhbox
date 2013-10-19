class dotfiles (
    $dependencies = $dotfiles::params::dependencies
) inherits dotfiles::params {
    validate_array($dependencies)

    anchor { 'dotfiles::begin': } ->
    class  { '::dotfiles::install': } ->
    anchor { 'dotfiles::end': }
}
