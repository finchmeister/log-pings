# Log Pings

A tiny bash script `log.sh` that logs internet connectivity via `ping`.

## Setup as Service

Copy `logs-ping.service` to `/etc/systemd/system/log-pings.service`


Enable service (will load on reboot):
```
sudo systemctl enable log-pings
```

Tail logs
```
ssh pi@192.168.0.23 "tail -f status.log"
```