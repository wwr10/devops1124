exec { "apt-update":
  command => '/usr/bin/apt-get update',
}

exec { "fix-debian-front":
  command => '/usr/bin/apt-get install -y gnupg2 apt-transport-https ca-certificates',
  before  => Package["vim", "nginx"],
}

package { [ "vim", "nginx" ]:
  ensure => installed,
  require => Exec["apt-update"],
}

service { 'nginx':
  ensure => running,
  require => Package['nginx'],
}
