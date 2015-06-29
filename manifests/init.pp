# == Class: profile_jenkins
#
# Full description of class profile_jenkins here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class profile_jenkins
{

  class { 'jenkins_job_builder':
    install_from_git => false,
    require          => Class[ 'jenkins' ],
  }

  class { 'profile_jenkins::jobs':
    require => Class[ 'jenkins_job_builder' ],
  }

  class { '::jenkins':
    configure_firewall => false,
    cli                => true,
    plugin_hash        => {
      'git-client' => {},
      'git'        => { version      => '1.4.0' },
      'github'     => {},
      'github-api' => {},
    },
  }
}
