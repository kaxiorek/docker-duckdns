#!/usr/bin/with-contenv bash

. /app/duck.conf
IPv6=$(ip addr show dev br0 | grep inet6 | grep global | cut -f6 -d' '| cut -f1 -d'/')
RESPONSE=`curl -s "https://www.duckdns.org/update?domains=$SUBDOMAINS&token=$TOKEN&ipv6=$IPv6"`
if [ "$RESPONSE" = "OK" ]; then
echo "Your IP was updated at "$(date)
else
echo "Something went wrong, please check your settings  "$(date)
fi
