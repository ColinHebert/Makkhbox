class makkhbox (
 $ssh_port = $makkhbox::params::ssh_port,
 $users    = $makkhbox::params::users,
) inherits makkhbox::params {
  if ! is_integer($ssh_port){
      fail("The SSH port must be an integer")
  }
  validate_array($users)

  anchor { 'makkhbox::begin': } ->
  class  { '::makkhbox::install': } ->
  class  { '::makkhbox::config': } ~>
  class  { '::makkhbox::service': } ->
  anchor { 'makkhbox::end': }
}
