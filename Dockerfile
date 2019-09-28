FROM postgres:11-alpine

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT **None**
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV SCHEDULE **None**
ENV FTP_URL **None**
ENV FTP_USER **None**
ENV FTP_PASSWORD **None**
ENV CHECK_URL **None**

RUN apk update && apk add curl
ADD upload.sh /upload.sh
ADD backup.sh /backup.sh
ADD run.sh /run.sh
RUN chmod +x /backup.sh && chmod +x /run.sh

USER root

CMD ["sh", "run.sh"]
