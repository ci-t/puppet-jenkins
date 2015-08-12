define jenkins_instance::packages(
$package=undef
)
{
 package {"$package":
  ensure => present
 }

}
