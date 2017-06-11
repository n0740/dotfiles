#!/bin/bash

hour=$(date +"%H")

fg="white"
bg="black"

if [ $hour -ge 0 ] && [ $hour -lt 7 ]; then
    fg="brightwhite"
    bg="red"
elif [ $hour -ge 22 ]; then
    fg="red"
elif [ $hour -ge 20 ]; then
    fg="brightred"
elif [ $hour -ge 18 ]; then
    fg="yellow"
fi

echo "#[bg=$bg]#[fg=${fg}]"
