FROM centos:7
MAINTAINER Sudeep Kumar Reddy Balineni<sbalinen@ftdi.com>

RUN yum -y update

#RUN yum install -y java
COPY /usr/java/jdk1.8.0_66 /usr/java/jdk1.8.0_66/
COPY /usr/local/apache-maven-3.5.3 /usr/local/apache-maven-3.5.3/

RUN ln -s /usr/java/jdk1.8.0_66/bin/java /usr/bin/java
RUN ln -s /usr/local/apache-maven-3.5.3/bin/mvn /usr/bin/mvn
RUN chmod -R 755 /usr/java/jdk1.8.0_66/

COPY '/home/jenkins/workspace/Jenkins slaves as Docker Containers/scripts/deliver.sh' '/root/
COPY '/home/jenkins/workspace/Jenkins slaves as Docker Containers/target/*.jar' '/root/


CMD ["/root/deliver.sh"]
