from fabric.api import *


@task
def create_container(name,project):
    label=project
    local("docker run --name {} -d -i my-redhat-jenkins-slave /bin/bash /etc/init.d/slave {} {}".format(name,name,label))
