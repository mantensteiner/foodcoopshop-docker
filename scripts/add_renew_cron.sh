crontab -l > foodcoopshopcron
echo "*/10 * * * * wget --no-check-certificate http://localhost/cron" >> foodcoopshopcron