# == Define profile_jenkins::job
#
# This define is called from profile_jenkins::jobs to install jobs.
#
define profile_jenkins::job($jobgiturl) {

  jenkins_job_builder::job { "${name}-start-job":
    job_yaml => template('profile_jenkins/jenkins-start-job.yaml.erb'),
    delay    => 10,
  }

  jenkins_job_builder::job { "${name}-spec-job":
    job_yaml => template('profile_jenkins/jenkins-spec-job.yaml.erb'),
  }

  jenkins_job_builder::job { "${name}-lint-job":
    job_yaml => template('profile_jenkins/jenkins-lint-job.yaml.erb'),
  }

  jenkins_job_builder::job { "${name}-doc-job":
    job_yaml => template('profile_jenkins/jenkins-doc-job.yaml.erb'),
  }

}

