#!/bin/sh
# Usage: ./script.sh enp1s0f0 http://10.2.0.113:8001

export INTERFACE="$1"
export API_URL="$2"
HOST=$(hostname)

URL="${API_URL}/api/v1/nodes/${HOST}/status"
TOKEN="ADD YOUR TOKEN HERE"

echo "Bandwidth Component..."
echo $HOST
echo $INTERFACE
echo $API_URL
echo $URL
echo $TOKEN

#speed=$(ethtool $INTERFACE | grep "Speed:" | sed 's/Speed://g')
#echo $speed

# Typically all values are in Mb/s
value=$(cat /sys/class/net/${INTERFACE}/speed)
speed=$(($value*100000))
echo $speed

# Add the Patch
curl --cacert ca.crt -H "Authorization: Bearer "${TOKEN}"" --header "Content-Type: application/json-patch+json" \
--request PATCH \
--data '[{"op": "add", "path": "/status/capacity/network.aware.com~1bandwidth", "value":'${speed}'}]' \
${URL}

