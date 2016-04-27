# v hedayati 2015
# simple user management tool.

define cust_tools::add_sshkeys (
  $uniq_name = $title,
  $user_name = '',
  $type      = '',
  $key       = '',
) {
  ssh_authorized_key { $uniq_name:
    user => $user_name,
    type => $type,
    key => $key
  }

  if ("$ssh_auth_keys") {
    create_resources('cust_tools::add_sshkeys', $ssh_auth_keys)
  }
}

