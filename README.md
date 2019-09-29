# Backup postgres to ftp by schedule

Usage example
```yaml
  postgres-backup:
    image: vmpartner/pg-schedule-backup:version-1.0.4
    environment:
      POSTGRES_DATABASE: "my_database"
      POSTGRES_HOST: "postgres"
      POSTGRES_PORT: 5432
      POSTGRES_USER: "my_user"
      POSTGRES_PASSWORD: "my_password"
      SCHEDULE: "0 */6 * * *"
      FTP_PASSWORD: "my_ftp_password"
      FTP_URL: "ftp://ftp.selcdn.ru/my_container/my_math/"
      FTP_USER: "my_ftp_user"
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