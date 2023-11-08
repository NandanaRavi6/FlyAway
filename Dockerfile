FROM tomcat:8.0.20-jre8
COPY flyaway*.war /usr/bin/tomcat/webapps/flyway.war
