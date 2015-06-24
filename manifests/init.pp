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

  package { 'jq': }

  user { 'jenkins':
    groups  => 'docker',
    require => Class['docker', 'jenkins'],
  }

  class { 'docker': }

#  jenkins::job { "${module_name}-start":
#    config  => template("${module_name}/start.xml.erb"),
#  }

  class { 'jenkins':
    configure_firewall => false,
    cli                => true,
    plugin_hash        => {
      'jenkins-cloudformation-plugin' => {},
      'htmlpublisher'                 => {},
      'rundeck'                       => {},
      'parameterized-trigger'         => {},
      'multiple-scms'                 => {},
      'git-client'                    => {},
      'git'                           => {},
      'github'                        => {},
      'github-api'                    => {},
      'token-macro'                   => {},
      'scm-api'                       => {},
      'promoted-builds'               => {},
      'matrix-project'                => {},
      'run-condition'                 => {},
      'conditional-buildstep'         => {},
      'rebuild'                       => {},
      'maven-plugin'                  => {},
      'subversion'                    => {},
      'googlecode'                    => {},
      'ssh-credentials'               => {},
      'credentials'                   => {},
      'analysis-core'                 => {},
      'warnings'                      => {},
      'rvm'                           => {},
      'project-health-report'         => {},
      'greenballs'                    => {},
      'jquery'                        => {},
      'build-pipeline-plugin'         => {},
      'delivery-pipeline-plugin'      => {},
      'ruby'                          => {},
      'ruby-runtime'                  => {},
      'dynamic-axis'                  => {},
      'envinject'                     => {},
    },
  }
}
