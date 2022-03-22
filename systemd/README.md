## Power management with systemd [Arch Linux Wiki](https://wiki.archlinux.org/title/Power_management#Console)

### Ignore laptop closing lid

Put this lines in `/etc/systemd/logind.conf`

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```
