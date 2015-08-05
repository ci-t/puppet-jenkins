class jenkins_instance::maven
{
  # Install Maven
class { "maven::maven":
  version => "3.3.1"

}

}
