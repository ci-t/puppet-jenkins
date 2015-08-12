define jenkins_instance::slave_hard
{
create_resources(package,hiera('packages'))

}
