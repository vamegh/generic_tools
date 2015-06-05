# module generic_tools::add_groups
# v hedayati 2015
# ive looked for a decent user tool which allows independant group management
# in puppet forge and none of them seem to handle group creation all that well
# or independantly from user creation. so hence why this exists.

define generic_tools::add_groups (
  $uniq_name            = $title,
  $group_name           = '',
  $ensure               = '',
  $allowdupe            = '',
  $attribute_membership = '',
  $attributes           = '',
  $auth_membership      = '',
  $forcelocal           = '',
  $gid                  = '',
  $ia_load_module       = '',
  $members              = '',
  $provider             = '',
  $system               = '',
) {

  if !empty("$ensure") {
    Group { ensure => $ensure, }
  }

  if !empty("$allowdupe") {
    Group { allowdupe => $allowdupe, }
  }

  if !empty("$attribute_membership") {
    Group { attribute_membership => $attribute_membership, }
  }

  if !empty("$attributes") {
    Group { attributes => $attributes, }
  }

  if !empty("$auth_membership") {
    Group { auth_membership => $auth_membership, }
  }

  if !empty("$forcelocal") {
    Group { forcelocal => $forcelocal, }
  }

  if !empty("$ia_load_module") {
    Group { ia_load_module => $ia_load_module, }
  }

  if !empty("$members") {
    Group { members => $members, }
  }

  if !empty("$provider") {
    Group { provider => $provider, }
  }

  if !empty("$system") {
    Group { system => $system, }
  }

  group { $uniq_name:
    gid => $gid,
  }
}

