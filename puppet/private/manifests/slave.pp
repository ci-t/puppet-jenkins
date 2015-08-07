class jenkins_instance::slave
(
$master_url      = hiera('master_url'),
$jenkins_user    = hiera('jenkins_user'),
$jenkins_pass    = hiera ('jenkins_pass')

)
{
  class {'jenkins::slave':
      masterurl => $master_url,
      ui_user   => $jenkins_user,
      ui_pass   => $jenkins_pass

    }

}
