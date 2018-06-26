FROM centos:7
MAINTAINER Sudeep Kumar Reddy Balineni<sbalinen@ftdi.com>

RUN yum -y update

#RUN yum install -y java
COPY /usr/java/jdk1.8.0_66 /usr/java/jdk1.8.0_66/

RUN ln -s /usr/java/jdk1.8.0_66/bin/java /usr/bin/java
RUN chmod -R 755 /usr/java/jdk1.8.0_66/

COPY '/home/jenkins/workspace/Jenkins slaves as Docker Containers/scripts/deliver.sh' '/root/


CMD ["/root/deliver.sh"]
