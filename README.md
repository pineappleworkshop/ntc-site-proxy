# Proxy (NGINX + Lets Encrypt SSL + Fail2ban)

## nginx reload config 
```bash
nginx -s reload
```
---

## Stress Test Proxy (apache bench)
```bash
# sudo apt-get install apache2-utils
ab -n 500 -c 20 https://www.example.com/
```

## Stress Test Proxy (seige)
```bash
# sudo apt-get install seige
```

## Fail2Ban Commands
 Following commands are excecuted from within the `mf-site-proxy` pod
### Monitor Jail Logs
```bash
$ tail -f /var/log/faillog
```

### Check Jail Statuses
NginX Request Limit Exceeded Jail
```bash
$ fail2ban-client status nginx-req-limit
```
NginX HTTP Auth Jail
```bash
$ fail2ban-client status nginx-http-auth
```
NginX Bot Search Jail
```bash
$ fail2ban-client status nginx-botsearch
```

### Un-jail an IP from nginx request limit exceed Jail
```bash
$ fail2ban-client set nginx-req-limit unbanip 190.141.201.132
```

### Manual Jail an IP
```bash
$ fail2ban-client -vvv set nginx-http-auth banip 192.168.255.205
```

### Manually unban all IPs for a jail
The best way to unban all IPs from a Jail is to set the ban time to 1 second momentarily and let fail2ban unban all the ips, then reset the jail time back to normal:
```bash
$ fail2ban-client set nginx-req-limit bantime 1;
# Later to reset back to normal
$ fail2ban-client set nginx-req-limit bantime 7200;
```
