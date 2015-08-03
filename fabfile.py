from fabric.api import *

container_name="project1"
@task
def create_container():
    local("docker run --name {}  -i my-redhat-jenkins-slave supervisord".format(container_name))
