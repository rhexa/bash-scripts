# Screen brightness

Acpi brightness
```
# See current acpi brightness
cat /sys/class/backlight/${MONITOR_DEVICE}/brightness

# set acpi brightness
echo "${VALUE}" | sudo tee /sys/class/backlight/${MONITOR_DEVICE}/brightness
```

xrandr brightness
```
# see current status
xrandr --current --verbose

# see current brightness
xrandr --current --verbose | grep -i -B5 bright

# set brightness
xrandr --output ${MONITOR} --brightness ${VALUE}
```
