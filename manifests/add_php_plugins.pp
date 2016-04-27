## A define to add multiple pear or pecl php plugins simultaneously, should be completely maneagable via hiera.

define generic_tools::add_php_plugins (
  $uniq_name            = $title,
  $pkg_name             = '',
  $discover             = false,
  $discover_url         = '',
  $install_command      = "pear install --alldeps",
  $discover_command     = "pear channel-discover",
  $file_check           = "/etc/pear_installed/${uniq_name}.installed",
) {
  $discover_pkg = "${discover_command} ${discover_url}"
  $install_pkg = "${install_command} ${pkg_name}"
  if ($discover) {
    exec { $discover_pkg :
      command   => $discover_pkg,
      creates   => $file_check,
      logoutput => 'on_failure',
    }
  }
  exec { $install_pkg :
    command   => $install_pkg,
    creates   => $file_check,
    logoutput => 'on_failure',
  }
}

