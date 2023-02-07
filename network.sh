#!/bin/bash

n=$(iwconfig wlp1s0 | sed -e '/ESSID/!d' -e 's/.*ESSID:"/"/' -e 's/"//g')
echo 直  
