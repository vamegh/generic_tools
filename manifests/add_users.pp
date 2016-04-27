# v hedayati 2015
# ive looked for a decent user tool which allows independant group management
# in puppet forge and none of them seem to handle group creation all that well
# or independantly from user creation. so hence why this exists.

define generic_tools::add_users (
  $uniq_name            = $title,
  $user_name            = '',
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
  $auths                = '',
  $comment              = '',
  $expiry               = '',
  $groups               = '',
  $home                 = '',
  $iterations           = '',
  $key_membership       = '',
  $keys                 = '',
  $loginclass           = '',
  $managehome           = '',
  $membership           = '',
  $password             = '',
  $password_max_age     = '',
  $password_min_age     = '',
  $profile_membership   = '',
  $profiles             = '',
  $project              = '',
  $purge_ssh_keys       = '',
  $role_membership      = '',
  $roles                = '',
  $salt                 = '',
  $shell                = '',
  $uid                  = '',
  $ssh_auth_keys        = '',
) {

  if !empty("$auths") {
    User { auths => $auths, }
  }

  if !empty("$comment") {
    User { comment => $comment, }
  }

  if !empty("$expiry") {
    User { expire => $expire, }
  }

  if !empty("$groups") {
    User { groups => $groups, }
  }

  if !empty("$home") {
    User { home => $home, }
  }

  if !empty("$iterations") {
    User { iterations => $iterations, }
  }

  if !empty("$key_membership") {
    User { key_membership => $key_membership, }
  }

  if !empty("$keys") {
    User { keys => $keys, }
  }

  if !empty("$loginclass") {
    User { loginclass => $loginclass, }
  }

  if !empty("$managehome") {
    User { managehome => $managehome, }
  }

  if !empty("$membership") {
    User { membership => $membership, }
  }

  if !empty("$password") {
    User { password => $password, }
  }

  if !empty("$password_max_age") {
    User { password_max_age => $password_max_age, }
  }

  if !empty("$password_min_age") {
    User { password_min_age => $password_min_age, }
  }

  if !empty("$profile_membership") {
    User { profile_membership => $profile_membership, }
  }

  if !empty("$profiles") {
    User { profiles => $profiles, }
  }

  if !empty("$project") {
    User { project => $project, }
  }

  if !empty("$purge_ssh_keys") {
    User { purge_ssh_keys => $purge_ssh_keys, }
  }

  if !empty("$role_membership") {
    User { role_membership => $role_membership, }
  }

  if !empty("$roles") {
    User { roles => $roles, }
  }

  if !empty("$salt") {
    User { salt => $salt, }
  }

  if !empty("$shell") {
    User { shell => $shell, }
  }

  if !empty("$uid") {
    User { uid => $uid, }
  }

  if !empty("$gid") {
    User { gid => $gid, }
  }

  if !empty("$allowdupe") {
    User { allowdupe => $allowdupe, }
  }

  if !empty("$attribute_membership") {
    User { attribute_membership => $attribute_membership, }
  }

  if !empty("$attributes") {
    User { attributes => $attributes, }
  }

  if !empty("$auth_membership") {
    User { auth_membership => $auth_membership, }
  }

  if !empty("$forcelocal") {
    User { forcelocal => $forcelocal, }
  }

  if !empty("$ia_load_module") {
    User { ia_load_module => $ia_load_module, }
  }

  if !empty("$members") {
    User { members => $members, }
  }

  if !empty("$provider") {
    User { provider => $provider, }
  }

  if !empty("$system") {
    User { system => $system, }
  }

  user { $uniq_name:
    ensure => $ensure,
  }

  if ("$ssh_auth_keys") {
    create_resources('generic_tools::add_sshkeys', $ssh_auth_keys)
  }
}

