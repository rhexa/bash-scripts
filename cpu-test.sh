#! /usr/bin/bash

# variables
# Cpus = cpu count (required)

# help
Help()
{
    echo ""
    echo "Cpu test is a cli tool to test cpu by stressing it out using sha1sum."
    echo ""
    echo "-c    : number of cpus to test. Ex: -c 2"
    echo "-h    : show this help"
}

# main
no_args="true"
while getopts "c:hk" option
do
    case $option in
        c)  # cpu count
            Cpus=$OPTARG;;
        
        k)  # kill the test
            echo "killing the test"
            pkill sha1sum
            exit;;

        *)  # help
            Help
            exit;;
    esac
    no_args="false"
done

# if no argument passed, show help
if [ $no_args == "true" ]; then Help; exit; fi

Main()
{
    for cpu in $(seq $Cpus)
    do
        echo "Running test on Cpu $cpu"
        sha1sum /dev/zero &
    done
}

Main
