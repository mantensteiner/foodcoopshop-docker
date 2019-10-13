RUN crontab -l > foodcoopshopcron
RUN echo "*/10 * * * * wget http://localhost/cron" >> foodcoopshopcron