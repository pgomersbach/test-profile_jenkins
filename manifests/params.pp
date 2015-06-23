# == Class profile_jenkins::params
#
# This class is meant to be called from profile_jenkins.
# It sets variables according to platform.
#
class profile_jenkins::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'profile_jenkins'
      $service_name = 'profile_jenkins'
    }
    'RedHat', 'Amazon': {
      $package_name = 'profile_jenkins'
      $service_name = 'profile_jenkins'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
