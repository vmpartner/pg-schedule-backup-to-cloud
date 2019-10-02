FROM postgres:11-alpine

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT **None**
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV SCHEDULE **None**
ENV CHECK_URL **None**

RUN apk update && apk add curl
ADD upload.sh /upload.sh
ADD backup.sh /backup.sh
ADD run.sh /run.sh
RUN chmod +x /backup.sh && chmod +x /run.sh && chmod +x /upload.sh
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

USER root

CMD ["sh", "run.sh"]
