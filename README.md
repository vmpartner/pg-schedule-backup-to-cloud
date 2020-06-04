# Backup postgres to ftp by schedule

Usage example
```yaml
  postgres-backup:
    image: vmpartner/pg-schedule-backup-to-cloud
    environment:
      POSTGRES_DATABASE: "my_database"
      POSTGRES_HOST: "postgres"
      POSTGRES_PORT: 5432
      POSTGRES_USER: "my_user"
      POSTGRES_PASSWORD: "my_password"
      SCHEDULE: "0 */6 * * *"
      RCLONE_CONFIG_SELECTEL_TYPE: "swift"
      RCLONE_CONFIG_SELECTEL_ENV_AUTH: "false"
      RCLONE_CONFIG_SELECTEL_USER: "my_user"
      RCLONE_CONFIG_SELECTEL_KEY: "my_password"
      RCLONE_CONFIG_SELECTEL_AUTH: "https://auth.selcdn.ru/v1.0"
      RCLONE_CONFIG_SELECTEL_ENDPOINT_TYPE: "public"
      RCLONE_DEST: "selectel:my_container/my_math"
      TZ: "Europe/Moscow"
      CHECK_URL: "https://hc-ping.com/my_check_token" # https://healthchecks.io
    volumes:
      - /backup:/backup
      - /etc/localtime:/etc/localtime:ro
    depends_on:
      - postgres
    links:
      - postgres
    labels:
      io.rancher.container.pull_image: always
```   
Word "SELECTEL" is just example, it is your custom destination config name. You can configure any destination that implemented in https://rclone.org

## Restore
For restore db copy file db to server and execute:
```
pg_restore --format=c --dbname="my_db" --jobs=4 --no-acl --username="my_user" -v my_file.sql
```
