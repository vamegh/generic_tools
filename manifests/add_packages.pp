# module generic_tools::add_packages
# v hedayati 2015
#
define generic_tools::add_packages (
  $pkg_name = $title,
  $ensure   = '',
) {
  package { $pkg_name:
    ensure => $ensure,
    name   => $pkg_name,
  }
}

