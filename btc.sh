#!/bin/sh
# requires jq to run

sleep 10.5
btc=$(curl -s https://api.coinbase.com/v2/prices/spot?currency=USD | jq .data.amount | sed 's/"//g; s/\.[^.]*$/\./; s/\.//; q')

if [[ $btc == '' ]]
then
	echo ''
else
	printf "  %s " $btc
fi



