class transmission (
 $service_user  = $transmission::params::service_user,
 $service_group = $transmission::params::service_group,
 $rpc_user      = $transmission::params::rpc_user,
 $rpc_password  = $transmission::params::rpc_password,
 $blocklist_url = $transmission::params::blocklist_url,
 $conf_dir      = $transmission::params::conf_dir,
) inherits transmission::params {
  validate_absolute_path($conf_dir)
  validate_string($service_user)
  validate_string($service_group)
  validate_string($rpc_user)
  validate_string($rpc_password)
  validate_string($blocklist_url)

  anchor { 'transmission::begin': } ->
  class  { '::transmission::install': } ->
  class  { '::transmission::config': } ~>
  class  { '::transmission::service': } ->
  anchor { 'transmission::end': }
}
