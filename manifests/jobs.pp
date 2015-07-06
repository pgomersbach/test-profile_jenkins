# == Class profile_jenkins::jobs
#
# This class is called from profile_jenkins to install jobs.
#
class profile_jenkins::jobs {

  include profile_jenkins::jobs

  $myjobs = {
    'profile_jenkins' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_jenkins.git' },
    'profile_puppetmaster' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_puppetmaster.git' },
    'profile_base' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_base.git' },
    'role_deployserver' => { jobgiturl    => 'https://github.com/pgomersbach/test-role_deployserver.git' },
    'role_ciserver' => { jobgiturl    => 'https://github.com/pgomersbach/test-role_ciserver.git' },
    'rspec_monitor' => { jobgiturl    => 'https://github.com/pgomersbach/test-rspec_monitor.git' },
  }

  create_resources(profile_jenkins::job, $myjobs)

}
