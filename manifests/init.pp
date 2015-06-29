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

  jenkins_job_builder::job { 'lint-job':
    job_yaml => template('profile_jenkins/jenkins-lint-job.yaml.erb'),
  }

  class { 'jenkins_job_builder':
    install_from_git => true,
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
