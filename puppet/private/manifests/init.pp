class jenkins_instance
{
   include jenkins
   include jenkins::master
 #anchor{'jenkins_instance::begin':}
   class { 'python':
    version    => 'system',
    pip        => true,
    dev        => true,
    virtualenv => true,
    gunicorn   => false,
    before     => Package["fabric"]
  }

  package { "fabric":
  ensure => present,
  require => Class['python']

  }
  #  anchor{'jenkins_instance::end':}
  #$defaults = { require => [Package[python-devel],Class['python']]}
 #create_resources(package,hiera('packages'),$defaults)

}
