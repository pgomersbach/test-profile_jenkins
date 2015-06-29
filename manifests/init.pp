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

  jenkins_job_builder::job { 'start-job':
    job_yaml => template('profile_jenkins/jenkins-start-job.yaml.erb'),
  }

  jenkins_job_builder::job { 'spec-job':
    job_yaml => template('profile_jenkins/jenkins-spec-job.yaml.erb'),
  }

  jenkins_job_builder::job { 'lintc-job':
    job_yaml => template('profile_jenkins/jenkins-lint-job.yaml.erb'),
  }

  class { 'jenkins_job_builder':
    install_from_git => true,
  }

  class { '::jenkins':
    configure_firewall => false,
    cli                => true,
    plugin_hash        => {
#      'jenkins-cloudformation-plugin' => {},
#      'htmlpublisher'                 => {},
#      'rundeck'                       => {},
#      'parameterized-trigger'         => {},
#      'multiple-scms'                 => {},
      'git-client'                    => {},
      'git'                           => { version      => '1.4.0' },
      'github'                        => {},
      'github-api'                    => {},
#      'token-macro'                   => {},
#      'scm-api'                       => {},
#      'promoted-builds'               => {},
#      'matrix-project'                => {},
#      'run-condition'                 => {},
#      'conditional-buildstep'         => {},
#      'rebuild'                       => {},
#      'maven-plugin'                  => {},
#      'subversion'                    => {},
#      'googlecode'                    => {},
#      'ssh-credentials'               => {},
#      'credentials'                   => {},
#      'analysis-core'                 => {},
#      'warnings'                      => {},
#      'rvm'                           => {},
#      'project-health-report'         => {},
#      'greenballs'                    => {},
#      'jquery'                        => {},
#      'build-pipeline-plugin'         => {},
#      'delivery-pipeline-plugin'      => {},
#      'ruby'                          => {},
#      'ruby-runtime'                  => {},
#      'dynamic-axis'                  => {},
#      'envinject'                     => {},
    },
  }
}
