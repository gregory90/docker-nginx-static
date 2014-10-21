FROM gregory90/nginx

ADD nginx/default /etc/nginx/sites-available/default
ADD run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]
