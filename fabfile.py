from fabric.api import *

@task
def create_container():
    run("docker run --add-host=slave1   -t -i my-redhat-jenkins-slave supervisord")
