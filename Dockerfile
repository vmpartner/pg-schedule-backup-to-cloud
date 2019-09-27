FROM postgres:11-alpine

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV SCHEDULE **None**

ADD backup.sh /backup.sh
ADD run.sh /run.sh
RUN chmod +x /backup.sh &&  chmod +x /run.sh

CMD ["sh", "run.sh"]
