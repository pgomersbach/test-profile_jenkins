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

 $job = {
   'config' => {
     'name'         => 'test-job',
     'description'  => 'This is a test job',
     'project-type' => 'freestyle',
     'scm'          => [
       'git' => {
         'url'      => 'git@github.com:opentable/puppet-jenkins_job_builder',
         'branches' => ['*/master']
       }
     ],
     'builders' => [
       'shell' => 'echo hello'
     ],
     'triggers' => [
       'pollscm' => '*/1 * * * *'
     ]
   }
 }

  jenkins_job_builder::job { 'testjob':
    config => $job,
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
