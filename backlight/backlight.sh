#! /usr/bin/bash

declare -i max=$(cat /sys/class/backlight/radeon_bl0/max_brightness)
declare -i current=$(cat /sys/class/backlight/radeon_bl0/brightness)
declare -i step=5*$max/100

# set brightness 1 step up
bUp(){
    local -i val=$current+$step
    echo $val | sudo tee /sys/class/backlight/radeon_bl0/brightness 
}

# set brightness 1 step up
bDown(){
    echo "down"
    local -i val=$current-$step
    echo $val | sudo tee /sys/class/backlight/radeon_bl0/brightness 
}

# show menu
showMenu(){
    echo "Simple brighness controller."
    echo ""
    echo "Params:"
    echo ""
    echo "up     Set brightness up"
    echo "down   Set brightness down"
}

# show menu if no argument given
if [ -z == $1 ]; then showMenu; fi

case $1 in
    up)     # brightness up
        bUp;;

    down)   # brightness down
        bDown;;
    current)    # get current brightness
        echo $current;;
    *)      # default
        showMenu;;
esac
