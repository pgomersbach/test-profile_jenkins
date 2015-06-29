# == Class profile_jenkins::jobs
#
# This class is called from profile_jenkins to install jobs.
#
class profile_jenkins::jobs {

  jenkins_job_builder::job { 'start-job':
    job_yaml => template('profile_jenkins/jenkins-start-job.yaml.erb'),
  }

  jenkins_job_builder::job { 'spec-job':
    job_yaml => template('profile_jenkins/jenkins-spec-job.yaml.erb'),
  }

  jenkins_job_builder::job { 'lint-job':
    job_yaml => template('profile_jenkins/jenkins-lint-job.yaml.erb'),
  }

}
