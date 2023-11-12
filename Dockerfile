# Use a base OS image
FROM ubuntu:20.04

# Update the package repository and install necessary tools
RUN apt update
RUN apt install -y openjdk-8-jdk
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*

# Set the Java environment variables
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Download and install Apache Tomcat
RUN apt install wget -y
RUN wget -q http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz -O /tmp/tomcat.tar.gz
RUN tar xf /tmp/tomcat.tar.gz -C /opt
RUN ln -s /opt/apache-tomcat-8.5.69 /opt/tomcat
RUN rm /tmp/tomcat.tar.gz

# Copy the application's war file
COPY FlyAway*.war /opt/tomcat/webapps/FlyAway.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]



