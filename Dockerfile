FROM postgres:9.4


COPY dvdrental.tar /data/
COPY ./init.sh /docker-entrypoint-initdb.d/
RUN chmod 777 -R /data
EXPOSE 5432/tcp
WORKDIR /data/
RUN chmod a+x /docker-entrypoint-initdb.d/init.sh
