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
  package { [ 'bundler' ,'libxslt1-dev', 'libxml2-dev', 'zlib1g-dev', 'git' ]:
    ensure => installed,
  }
  package { [ 'json', 'yard' ]:
    ensure   => installed,
    provider => gem,
  }

  class { 'jenkins_job_builder':
    version          => 'latest',
    jenkins_url      => 'http://localhost:9090',
    install_from_git => true,
    require          => Class[ 'jenkins' ],
  }

  class { 'profile_jenkins::jobs':
    require => Class[ 'jenkins_job_builder' ],
  }

  class { '::jenkins':
    configure_firewall => false,
    cli                => true,
    config_hash        => {
      'HTTP_PORT' => { 'value' => '9090' }
    },

    plugin_hash        => {
      'git-client'               => {},
      'git'                      => { version      => '1.4.0' },
      'github'                   => {},
      'github-api'               => {},
      'matrix-project'           => {},
      'workflow-aggregator'      => {},
      'htmlpublisher'            => {},
      'jquery'                   => {},
      'parameterized-trigger'    => {},
      'token-macro'              => {},
      'delivery-pipeline-plugin' => {},
    },
  }
}
