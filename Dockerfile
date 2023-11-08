FROM tomcat:9.0.82-jdk11
COPY flyaway*.war /usr/local/tomcat/webapps/flyaway.war
