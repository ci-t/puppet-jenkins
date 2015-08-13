from fabric.api import *
from fabric.contrib.project import rsync_project


@task
def create_container(name,project,image='my-redhat-jenkins-slave'):
    label=project
    local("docker run --name {} -d -i {} /bin/bash /etc/init.d/slave {} {}".format(name,image,name,label))

@task
def build_container(image='my-redhat-jenkins-slave',version='latest'):
    local("cd puppet;librarian-puppet install;cd ../;docker build -t {}:{} .".format(image,version))

@task
def test_ado(param):
    local("echo HOlaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

@task
def provision(host_rsync,remote_user,role_string,home_user='/home/vagrant/puppet'):
    env.host_string="{}".format(host_rsync)    
    env.sudo_user='vagrant'
    env.use_ssh_config = True
    env.print_only = False
    rsync_project("/home/vagrant/", "./puppet",delete= True, ssh_opts='-o StrictHostKeyChecking=no')
    environment_facts={}
    environment_facts['FACTER_role'.format(role_string)] = role_string
        
    
    modulepath="{}/modules".format(home_user)
    manifests="{}/manifests".format(home_user)
    hiera_config="{}/hiera.yaml".format(home_user)
    pp="{}/manifests/site.pp".format(home_user)
    with cd('puppet'), settings(warn_only=True),shell_env(**environment_facts):
     result = run('librarian-puppet install;sudo echo "role == $FACTER_role";sudo puppet apply --modulepath {} --hiera_config {} {} --debug'.format(modulepath,hiera_config,pp))
