#!/bin/sh
# Description: Script to get wifi and ethernet status

SHOW_WNAME=false
SHOW_ENAME=false

info="$(nmcli dev | grep 'wifi')"
echo "$info" | grep -wq 'connected' && WSYM='' || WSYM=''
$SHOW_WNAME && WNAME="$(echo "$info" | awk '$1=$2=$3=""; FNR == 1 {print $0};' | sed 's/^ *//g')"

info="$(nmcli dev | grep 'ethernet')"
echo "$info" | grep -wq 'connected' && ESYM='' || ESYM=''
$SHOW_ENAME && ENAME="$(echo "$info" | awk '$1=$2=$3=""; FNR == 1 {print $0};' | sed 's/^ *//g')"

printf "%s" "$WSYM" && $SHOW_WNAME && printf " %s" "$WNAME"
[ -n "$ESYM" ] && printf " %s" "$ESYM" && $SHOW_ENAME && printf " %s" "$ENAME"
&& exit 0
