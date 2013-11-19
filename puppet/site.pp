node default {

  class { '::mysql::server':
    root_password      => 'rootpw',
  }

  mysql_database { 'morgue':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_swedish_ci',
  }

  mysql_grant { 'morgue@%/morgue.*':
    ensure     => present,
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => 'morgue.*',
    user       => 'morgue@%',
  }

  class { 'apache':
    mpm_module => 'prefork',
  }
  class { 'apache::mod::php': }
  apache::vhost { 'morgue':
    docroot          => '/vagrant/morgue',
    directories      => [ {
      path           => '/vagrant/morgue',
      allow_override => 'All',
    } ],
    setenv           => [
      'MORGUE_ENVIRONMENT development',
    ],
  }
}
