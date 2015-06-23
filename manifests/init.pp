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
  # a profile class includes one or more classes, please include below
  jenkins::job { "${module_name}-start":
    config => template("${module_name}/start.xml.erb"),
  }

  class { '::jenkins':
    configure_firewall => false,
    cli                => true,
    plugin_hash        => {
      'jenkins-cloudformation-plugin' => {},
      'htmlpublisher'                 => {},
      'rundeck'                       => {},
      'parameterized-trigger'         => {},
      'multiple-scms'                 => {},
      'git-client'                    => {},
      'git'                           => { version      => '1.4.0' },
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
