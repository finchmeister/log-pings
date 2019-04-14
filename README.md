# Log Pings

A tiny bash script `log.sh` that logs internet connectivity via `ping`.

## Setup as Service

Copy `logs-ping.service` to `/etc/systemd/system/log-pings.service`


Enable service (will load on reboot):
```
sudo systemctl enable log-pings
```
Restart (to get going)
```
sudo systemctl restart log-pings
```
View service logs
```
journalctl -u log-pings.service
```

## Commands

```
tail -f status.log
python stats.py
```

## Alt Method

```
cat /var/log/messages* | grep eth0
```

### Append skip to log

```
sed -ie 's/Thu 28 Mar 15:03:33 GMT 2019::DOWN/Thu 28 Mar 15:03:33 GMT 2019::DOWNs/' status.log
```