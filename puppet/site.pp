node default {

  class { '::mysql::server':
    root_password      => 'rootpw',
  }

  mysql::db { 'morgue':
    ensure   => 'present',
    user     => 'morgue_user',
    password => 'morgue_password',
    host     => 'localhost',
  }

  class { 'apache':
    mpm_module => 'prefork',
  }
  class { 'apache::mod::php': }
  apache::vhost { 'morgue':
    port            => 80,
    docroot         => '/vagrant/morgue',
    custom_fragment => 'php_value include_path ".:/usr/share/pear:./features"',
    directories     => [ {
      path            => '/vagrant/morgue',
      allow_override  => 'All',
    } ],
    setenv          => [
      'MORGUE_ENVIRONMENT development',
    ],
  }

  package { ['php-pdo','php-mysql']:
    ensure => 'installed',
    notify => Class['apache::service'],
  }
}
