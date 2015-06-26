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
  class { 'docker': }

  user { 'jenkins':
    groups  => 'docker',
    require => Class['docker'],
  }

  exec { 'install_jenkins_package_keys':
    command => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | /usr/bin/apt-key add - ',
    unless  => '/usr/bin/test -f /etc/apt/sources.list.d/jenkins.list',
  }

  file { "/etc/apt/sources.list.d/jenkins.list":
      mode => '0644',
     owner => root,
     group => root,
    source => "puppet:///modules/${module_name}/jenkins.list",
    notify => Exec[ '/usr/bin/apt-get update' ],
  }

  exec { '/usr/bin/apt-get update':
    refreshonly => true,
  }

  package { 'jenkins':
      ensure => latest,
    require  => [ Exec['install_jenkins_package_keys'],
                  File['/etc/apt/sources.list.d/jenkins.list'], ],
  }

  service { 'jenkins':
    ensure  => running,
    require => Package[ 'jenkins' ],
  }

}
