# Use a base OS image
FROM ubuntu:20.04

# Update the package repository and install necessary tools
RUN apt update
RUN apt install -y openjdk-8-jdk

# Set the Java environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Download and install Apache Tomcat
RUN apt install wget -y
RUN wget -c https://downloads.apache.org/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz
RUN tar -xvf apache-tomcat-9.0.34.tar.gz  tomcat
RUN ln -s tomcat /opt/tomcat
RUN rm /tmp/apache-tomcat-9.0.34.tar.gz

# Copy the application's war file
COPY FlyAway*.war /opt/tomcat/webapps/FlyAway.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]



