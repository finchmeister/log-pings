# Log Pings

A tiny bash script `log.sh` that logs internet connectivity via `ping`.

## Setup as Service

Copy `logs-ping.service` to `/etc/systemd/system/log-pings.service`


Enable service (will load on reboot):
```
sudo systemctl enable log-pings
```
Restart
```
sudo systemctl restart log-pings
```

Tail logs
```
ssh pi@192.168.0.23 "tail -f status.log"
```

## Alt Method

```
cat /var/log/messages* | grep eth0
```

### Append skip to log

```
sed -ie 's/Sun 10 Mar 11:32:08 GMT 2019::DOWN/Sun 10 Mar 11:32:08 GMT 2019::DOWNs/' status.log
```