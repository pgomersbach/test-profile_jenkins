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
  class { '::jenkins':
    cli => true,
  }
  jenkins::plugin {'git-plugin':
    name    => 'git',
#    version => '2.3.4',
  }
}
