FROM tomcat:10-jre11

ADD target/wavsep-0.0.1-SNAPSHOT/WEB-INF/lib/* /usr/local/tomcat/lib/
ADD target/wavsep-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/wavsep.war
