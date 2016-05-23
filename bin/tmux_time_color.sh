#!/bin/bash

hour=$(date +"%H")

color="white"
if [ $hour -lt 9 ] || [ $hour -ge 22 ]; then
    color="red"
elif [ $hour -ge 20 ]; then
    color="brightred"
elif [ $hour -ge 18 ]; then
    color="yellow"
fi

echo "#[fg=${color}]"
