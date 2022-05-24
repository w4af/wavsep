FROM jetty

ADD target/wavsep-0.0.1-SNAPSHOT.war /var/lib/jetty/webapps/wavsep.war
