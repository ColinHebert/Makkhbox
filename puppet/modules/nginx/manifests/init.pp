class nginx (
    $conf_dir = $nginx::params::configuration_path,
) inherits nginx::params {
  validate_absolute_path($conf_dir)

  anchor { 'nginx::begin': } ->
  class  { '::nginx::install': } ->
  class  { '::nginx::config': } ~>
  class  { '::nginx::service': } ->
  anchor { 'nginx::end': }
}
