# Class: ucarp::params
#
# This module contain the parameters for UCARP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ucarp::params
#
class ucarp::params {

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $packageCommon = 'ucarp'

      # Config definition
      $configUcarpConf = '/etc/ucarp/vip-common.conf'

      # Service definition
      $serviceName = 'ucarp'

      # Upscript/Downscript directory
      $scriptDir = '/usr/libexec/ucarp'

      # Upscript/Downscript templates
      $upscript = 'ucarp/vip-up.erb'
      $downscript = 'ucarp/vip-down.erb'
    }

    'Gentoo' : {
      $linux = true

      # Package definition
      $packageCommon = 'net-misc/ucarp'

      # Config definition
      $configUcarpConf = '/etc/conf.d/ucarp'

      # Service definition
      $serviceName = 'ucarp'

      # Upscript/Downscript directory
      $scriptDir = '/usr/libexec/ucarp'

      # Upscript/Downscript templates
      $upscript = 'ucarp/vip-up-Gentoo.erb'
      $downscript = 'ucarp/vip-down-Gentoo.erb'
    }

    default  : {
      $linux = false
    }
  }

  # UCARP definitions
  $vId = '001'
  $vIp = '192.168.0.1'
  $vIpPrefixLength = '24'
  $vIf = 'eth0'
  $vPw = 'SuperHyperSecret'

  # Upscript/Downscript executable
  $upscriptExec = "vip-up"
  $downscriptExec = "vip-down"
}
