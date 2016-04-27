define cust_tools::add_hosts (
  $host_name    = $title,
  $ensure       = '',
  $comment      = '',
  $host_aliases = '',
  $ip           = '',
  $provider     = '',
  $target       = '',
) {

  if !empty("$ensure") {
    Host { ensure => $ensure, }
  }

  if !empty("$comment") {
    Host { comment => $comment, }
  }

  if !empty("$provider") {
    Host { provider => $provider, }
  }

  if !empty("$target") {
    Host { target => $target, }
  }

  if !empty("$host_aliases") {
    Host { host_aliases => $host_aliases, }
  }

  host { $host_name:
    ip => $ip,
  }
}

