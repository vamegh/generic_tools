# add cron jobs in a generic define -- allows us to loop through a hiera hash
# allows the data structure to be dumped into hiera control

define generic_tools::add_cron (
  $uniq_name            = $title,
  $ensure               = '',
  $command              = '',
  $user                 = '',
  $hour                 = '',
  $minute               = '',
) {

  if !empty("$user") {
    Cron { user => $user, }
  }

  if !empty("$hour") {
    Cron { hour => $hour, }
  }

  if !empty("$minute") {
    Cron { minute => $minute, }
  }

  cron { "$uniq_name":
    command => $command,
    ensure  => $ensure,
  }
}

