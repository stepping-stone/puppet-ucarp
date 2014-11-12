# Class: ucarp::scripts
#
# This module contains the scripts configuration for UCARP.
# Currently, this is just the up- and down-scripts.
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ucarp::package
#
class ucarp::scripts {
  file {
    "${ucarp::params::scriptDir}/${ucarp::upscriptExec}":
      ensure  => file,
      mode    => '700',
      owner   => 'root',
      group   => 'root',
      path    => "${ucarp::params::scriptDir}/${ucarp::upscriptExec}",
      content => template($ucarp::upscript);

    "${ucarp::params::scriptDir}/${ucarp::downscriptExec}":
      ensure  => file,
      mode    => '700',
      owner   => 'root',
      group   => 'root',
      path    => "${ucarp::params::scriptDir}/${ucarp::downscriptExec}",
      content => template($ucarp::downscript);
  }
}
