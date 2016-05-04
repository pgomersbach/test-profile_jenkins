# == Class profile_jenkins::jobs
#
# This class is called from profile_jenkins to install jobs.
#
class profile_jenkins::jobs {


  $myjobs = {
    'rely_profile_development' => { jobgiturl => 'https://github.com/relybv/rely-profile_development.git' },
    'dirict_profile_apache' => { jobgiturl => 'https://github.com/relybv/dirict-profile_apache.git' },
    'dirict_profile_base' => { jobgiturl => 'https://github.com/relybv/dirict-profile_base.git' },
    'dirict_profile_haproxy' => { jobgiturl => 'https://github.com/relybv/dirict-profile_haproxy.git' },
    'dirict_profile_mysql' => { jobgiturl => 'https://github.com/relybv/dirict-profile_mysql.git' },
    'dirict_profile_nfs' => { jobgiturl => 'https://github.com/relybv/dirict-profile_nfs.git' },
    'dirict_profile_rsyslog' => { jobgiturl => 'https://github.com/relybv/dirict-profile_rsyslog.git' },
    'dirict_role_appl' => { jobgiturl => 'https://github.com/relybv/dirict-role_appl.git' },
    'dirict_role_aio' => { jobgiturl => 'https://github.com/relybv/dirict-role_aio.git' },
    'dirict_role_db' => { jobgiturl => 'https://github.com/relybv/dirict-role_db.git' },
    'dirict_role_lb' => { jobgiturl => 'https://github.com/relybv/dirict-role_lb.git' },
    'dirict_role_monitor' => { jobgiturl => 'https://github.com/relybv/dirict-role_monitor.git' },
    'profile_jenkins' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_jenkins.git' },
    'profile_puppetmaster' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_puppetmaster.git' },
    'profile_base' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_base.git' },
    'profile_mcollective' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_mcollective.git' },
    'profile_rundeck' => { jobgiturl    => 'https://github.com/pgomersbach/test-profile_rundeck.git' },
    'role_deployserver' => { jobgiturl    => 'https://github.com/pgomersbach/test-role_deployserver.git' },
    'role_ciserver' => { jobgiturl    => 'https://github.com/pgomersbach/test-role_ciserver.git' },
    'rspec_monitor' => { jobgiturl    => 'https://github.com/pgomersbach/test-rspec_monitor.git' },
    'role_aio' => { jobgiturl => 'https://github.com/pgomersbach/test-role_aio.git' },
    'naturalis_suricata' => { jobgiturl => 'https://github.com/naturalis/suricata.git' },
    'naturalis_scirius' => { jobgiturl => 'https://github.com/naturalis/scirius.git' },
    'naturalis_role_ids' => { jobgiturl => 'https://github.com/naturalis/role_ids.git' },
  }

  create_resources(profile_jenkins::job, $myjobs)

}
