#!/bin/sh
# requires jq to run

printf " %s" "$(curl -s https://api.coinbase.com/v2/prices/spot?currency=USD | jq .data.amount | sed 's/"//g; s/\.[^.]*$/\./; s/\.//; q')"
