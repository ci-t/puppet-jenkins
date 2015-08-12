class jenkins_instance::slave
(
$master_url      = hiera('master_url'),
$jenkins_user    = hiera('jenkins_user'),
$jenkins_pass    = hiera ('jenkins_pass')

)
{
   $jenkins_home='/home/jenkins-slave'
   $version     ='1.22'
   class {'jenkins::slave':
      masterurl => $master_url,
      ui_user   => $jenkins_user,
      ui_pass   => $jenkins_pass,
      ensure    => 'stopped',
      version   => $version
   } -> 

   file {'/etc/init.d/slave':
    content => template('jenkins_instance/slave.erb'),
    mode    => '755'
  }


 create_resources(jenkins_instance::packages,hiera('packages'))






 

} 
