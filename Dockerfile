FROM postgres:11-alpine

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV SCHEDULE **None**

ADD backup.sh /backup.sh
ADD install.sh /install.sh
ADD run.sh /run.sh

RUN echo "$SCHEDULE /backup.sh" > /crontab.txt && \
    echo "$POSTGRES_PASSWORD" > /root/.pgpass && chmod 0600 /root/.pgpass && \
    /usr/bin/crontab /crontab.txt && \
    /usr/bin/sh install.sh

CMD ["sh", "run.sh"]
