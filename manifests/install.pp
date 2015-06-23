# == Class profile_jenkins::install
#
# This class is called from profile_jenkins for install.
#
class profile_jenkins::install {

  package { $::profile_jenkins::package_name:
    ensure => present,
  }
}
