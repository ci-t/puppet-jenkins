from fabric.api import *


@task
def create_container(name,project,image='my-redhat-jenkins-slave'):
    label=project
    local("docker run --name {} -d -i {} /bin/bash /etc/init.d/slave {} {}".format(name,image,name,label))

@task
def build_container(image='my-redhat-jenkins-slave',version='latest'):
    local("cd puppet;librarian-puppet install;cd ../;docker build -t {}:{} .".format(image,version))
