from fabric.api import *


@task
def create_container(name):
    local("docker run --name {}  -i my-redhat-jenkins-slave /bin/bash /etc/init.d/slave".format(name))
