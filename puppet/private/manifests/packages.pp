define jenkins_instance::packages(
$package=hiera('packages')
)
{
 package {"$package":
  ensure => present
 }

}
