FROM centos:7
MAINTAINER Sudeep Kumar Reddy Balineni<sbalinen@ftdi.com>

RUN yum -y update

RUN yum install -y java maven docker-client


#RUN ln -s /usr/java/jdk1.8.0_66/bin/java /usr/bin/java
#RUN ln -s /usr/local/apache-maven-3.5.3/bin/mvn /usr/bin/mvn
#RUN chmod -R 755 /usr/java/jdk1.8.0_66/

CMD ["/home/jenkins/workspace/JenkinsSlavesAsDockerContainers/jenkins/scripts/deliver.sh"]
