FROM tomcat:8-alpine
EXPOSE 8080
ADD ./target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war


