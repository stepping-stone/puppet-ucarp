# Class: ucarp::config
#
# This module contain the configuration for UCARP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ucarp::config
#
class ucarp::config {

  $ucarpConfigTemplate = $::osfamily ? {
    'Gentoo' => 'vip-gentoo.conf.erb',
    'RedHat' => 'vip-common.conf.erb',
  }

  # UCARP configuration
  file {
    $ucarp::params::configUcarpConf:
      ensure  => present,
      mode    => 600,
      owner   => root,
      group   => root,
      path    => $ucarp::params::configUcarpConf,
      content => template($ucarpConfigTemplate);
  }

  case $::osfamily {
    'RedHat': {
      $localVipFile = "/etc/ucarp/vip-${ucarp::vId}.conf"

      file {
        $localVipFile:
          ensure  => present,
          mode    => 644,
          owner   => root,
          group   => root,
          path    => $localVipFile,
          content => template('ucarp/etc/vip-000.conf.erb');
      }

    'Gentoo': {
      # Gentoo stores the UCARP shared secret in a file, in order to hide it
      # from the process list
      $ucarpPassFile = "/etc/ucarp/ucarp-${ucarp::vId}.pass"

      file {
        $localVipFile:
          ensure  => present,
          mode    => 600,
          owner   => root,
          group   => root,
          path    => $ucarpPassFile,
          content => ${ucarp::vPw};
      }
    }
  }
}
