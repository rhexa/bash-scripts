#! /usr/bin/bash

# get current brightness
getCurrent(){
    echo $(xrandr --verbose | grep -i -A5 edp | tail -n1 | cut -d' ' -f2 | sed 's/\.//')
}

# set brightness 1 step up
bUp(){
    # if the current brightness value reach the max limit
    # exit the program
    if [ $current -eq $max ]
    then
        echo "You reached the max limit"
        return
    fi

    local -i val=$current+$step
    toFloat $val
    
    xrandr --output "$monitor" --brightness $(toFloat $val)
}

# set brightness 1 step up
bDown(){
    # if the current brightness value reach the max limit
    # exit the program
    if [ $current -eq $min ]
    then
        echo "You reached the min limit"
        return
    fi

    local -i val=$current-$step
    toFloat $val
    
    xrandr --output "$monitor" --brightness $(toFloat $val)
}

# show menu
showMenu(){
    echo "Simple brighness controller running on top of xrandr."
    echo ""
    echo "Params:"
    echo ""
    echo "up        Set brightness up"
    echo "down      Set brightness down"
    echo "curremt   get current brightness"
}

toFloat(){
    local -i x=$1
    local -i a=${x:0:1}
    local -i b=${x:1}
    echo "$a.$b"
}

# Declaration
declare monitor="eDP-1"
declare -i max=20   # 2.0
declare -i min=10   # 1.0
declare -i current=$(getCurrent)
declare -i step=1

# show menu if no argument given
if [ -z == $1 ]; then showMenu; fi

case $1 in
    up)     # brightness up
        bUp;;

    down)   # brightness down
        bDown;;
    current)    # get current brightness
        toFloat $(getCurrent);;
    *)      # default
        showMenu;;
esac
