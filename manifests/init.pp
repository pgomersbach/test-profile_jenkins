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
  package { [ 'bundler' ,'libxslt1-dev', 'libxml2-dev', 'zlib1g-dev', 'git', 'daemon' ]:
    ensure => installed,
  }

  exec { 'update_six':
    command => '/usr/bin/pip install --upgrade six>=1.90',
    require => Class[ 'jenkins_job_builder' ],
  }

#  package { [ 'json', 'yard' ]:
#    ensure   => installed,
#    provider => gem,
#  }

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
    repo               => false,
#    direct_download    => 'http://pkg.jenkins-ci.org/debian-stable/binary/jenkins_1.651.1_all.deb',
    direct_download    => 'http://pkg.jenkins-ci.org/debian-stable/binary/jenkins_1.651.3_all.deb',
    configure_firewall => false,
    cli                => true,
    config_hash        => {
      'HTTP_PORT' => {
        'value' => '9090',
      },
    },
    plugin_hash        => {
      'git-client'               => {},
      'git'                      => {},
      'github'                   => {},
      'github-api'               => {},
      'plain-credentials'        => {},
      'matrix-project'           => {},
      'durable-task'             => {},
      'workflow-step-api'        => {},
      'htmlpublisher'            => {},
      'jquery'                   => {},
      'parameterized-trigger'    => {},
      'token-macro'              => {},
      'delivery-pipeline-plugin' => {},
      'scm-api'                  => {},
      'conditional-buildstep'    => {},
    },
  }
}
