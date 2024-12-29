FROM openjdk:17-slim
ENV CATALINA_HOME=/usr/local/tomcat
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz \
    && tar xzf apache-tomcat-9.0.98.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-tomcat-9.0.98 $CATALINA_HOME \
    && rm apache-tomcat-9.0.98.tar.gz \
    && chmod +x $CATALINA_HOME/bin/*.sh \
    && apt-get remove --purge -y wget \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
WORKDIR $CATALINA_HOME/webapps/ROOT/
COPY ./HTML ./
COPY ./CSS ./CSS
COPY ./JS ./JS
COPY ./IMAGES ./IMAGES
COPY ./WEB-INF /app/WEB-INF
EXPOSE 8080
CMD ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]
