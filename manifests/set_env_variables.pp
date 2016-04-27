##
# generic_tools::set_env_variables
#  this is based on:
#  https://github.com/Flameeyes/puppet-env and
#  https://forge.puppetlabs.com/puppetlabs/concat
##

define generic_tools::set_env_variables (
  $uniq_name        = $title,
  $env_name         = '',
  $custom_env_path  = '',
  $env_path         = '/etc/profile.d/',
  $custom_env_file  = "puppet-env.sh",
  $env_file         = "puppet-env.sh",
  $value            = '',
  $set_facter       = true,
  $set_sysenv       = true,
  $order            = '10',
) {

  ## a glut of ifs

  $env_pwd = "${env_path}/${env_file}"
  if !defined (Concat["${env_pwd}"]) {
    concat { $env_pwd:
      owner => 'root',
      group => 'root',
      mode  => '0755',
    }
    concat::fragment {
      "env_header_${uniq_name}_sh":
        target => $env_pwd,
        content => "## This file is managed by Puppet \n################\n\n",
        order => '01',
    }
  }

  $custom_env_pwd = "${custom_env_path}/${custom_env_file}"
  if !defined (Concat["${custom_env_pwd}"]) {
    concat { $custom_env_pwd:
      owner => 'root',
      group => 'root',
      mode  => '0755',
    }

    concat::fragment {
      "custom_env_header_${uniq_name}_sh":
        target => $custom_env_pwd,
        content => "## This file is managed by Puppet \n################\n\n",
        order => '01',
    }
  }

  if ($set_facter) {
    if ($set_sysenv) {
      concat::fragment {
        "env_frag_${uniq_name}_sh":
          target => "${env_pwd}",
          order => $order,
          content => "export ${env_name}=${value}\nexport FACTER_${env_name}=${value}\n",
      }
    }
  } else {
    if ($set_sysenv) {
      concat::fragment {
        "env_frag_${uniq_name}_sh":
          target => "${env_pwd}",
          order => $order,
          content => "export ${env_name}=${value}\n",
      }
    }
  }
}

