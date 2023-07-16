FROM danieldent/nginx-ssl-proxy

COPY proxy.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/

RUN apt-get update
RUN apt-get -y install fail2ban nano
COPY fail2ban/jail.d/defaults-debian.conf /etc/fail2ban/jail.d/
COPY fail2ban/filter.d/nginx-req-limit.conf /etc/fail2ban/filter.d/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh; sleep infinity
# ENTRYPOINT ["/entrypoint.sh", "/dev/null"]