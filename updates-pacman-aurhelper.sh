#!/bin/sh

yay -Sy>/dev/null

if ! updates_aur=$(yay -Qu 2> /dev/null | wc -l); then
    updates_aur=0
fi

if [ "$updates_aur" -gt 0 ]; then
    echo "痢 $updates_aur "
else
    echo ""
fi

