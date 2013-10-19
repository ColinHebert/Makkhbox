class makkhbox (
 $ssh_port = $makkhbox::params::ssh_port,
 $users    = $makkhbox::params::users,
) inherits makkhbox::params {
  validate_integer($ssh_port)
  array($users)

  anchor { 'makkhbox::begin': } ->
  class  { '::makkhbox::install': } ->
  class  { '::makkhbox::config': } ~>
  class  { '::makkhbox::service': } ->
  anchor { 'makkhbox::end': }
}
