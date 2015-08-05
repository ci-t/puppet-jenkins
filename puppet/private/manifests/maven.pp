class jenkins_instance::maven
{
  # Install Maven
class { "maven::maven":
  version => "3.2.6"

}

}
