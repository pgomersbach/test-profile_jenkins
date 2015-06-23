# == Class profile_jenkins::service
#
# This class is meant to be called from profile_jenkins.
# It ensure the service is running.
#
class profile_jenkins::service {

  service { $::profile_jenkins::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
