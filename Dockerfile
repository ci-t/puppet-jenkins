FROM rhel6:latest

MAINTAINER Devops IT "devops"

ADD resolv.conf /etc/resolv.conf

RUN yum -y update
RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN yum -y install openssh-server tar


RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

RUN yum install puppet -y

RUN mkdir -p /tmp/puppet

ADD puppet /tmp/puppet/

RUN ls /tmp


RUN export FACTER_role=slave; cd /tmp/puppet; puppet apply --modulepath=/tmp/puppet/modules/ /tmp/puppet/manifests/site.pp  --hiera_config=/tmp/puppet/hiera.yaml  --debug

RUN echo "=====================MASTER=========================="

RUN export FACTER_role=master; cd /tmp/puppet; puppet apply --modulepath=/tmp/puppet/modules/ /tmp/puppet/manifests/site.pp  --hiera_config=/tmp/puppet/hiera.yaml  --debug

RUN echo "====================SLAVE-HARD========================="
RUN export FACTER_role=slave-hard; cd /tmp/puppet; puppet apply --modulepath=/tmp/puppet/modules/ /tmp/puppet/manifests/site.pp  --hiera_config=/tmp/puppet/hiera.yaml  --debug

#ADD http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar /var/lib/jenkins/swarm-client.jar
 #RUN java -jar /var/lib/jenkins/swarm-client.jar -master http://192.168.3.29:8080 -username rmoyano -password 123 -labels test


WORKDIR /var/lib/jenkins



RUN echo "root:password" | chpasswd

RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd

RUN mkdir -p /var/run/supervisord
ADD supervisord.conf /etc/supervisord.conf
#ADD slave /etc/init.d/slave
#RUN chmod 775 /etc/init.d/slave
EXPOSE 22

