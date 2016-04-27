##
#  this is based on:
#  https://github.com/Flameeyes/puppet-env and
#  https://forge.puppetlabs.com/puppetlabs/concat
##

define cust_tools::setenv (
  $uniq_name = $title,
  $env_name = '',
  $env_path = '/etc/profile.d/',
  $env_file = "puppet-env.sh",
  $value = '',
  $set_facter = true,
  $set_sysenv = true,
  $order = '10',
) {

  ## a glut of ifs -- but it allows us to do the following:
  ## write out facter lines if set
  ## write system profiles.d cfgs if set

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

