#!/bin/bash

# As per https://apple.stackexchange.com/questions/191879/how-to-find-the-currently-connected-network-service-from-the-command-line
# Provided by Reorx

services=$(networksetup -listnetworkserviceorder | grep 'Hardware Port')

while read line; do
    sname=$(echo "$line" | awk -F  "(, )|(: )|[)]" '{print $2}')
    sdev=$(echo "$line" | awk -F  "(, )|(: )|[)]" '{print $4}')
    #echo "Current service: $sname, $sdev, $currentservice"
    if [ -n "$sdev" ]; then
        ifout="$(ifconfig "$sdev" 2>/dev/null)"
        echo "$ifout" | grep 'status: active' > /dev/null 2>&1
        rc="$?"
        if [ "$rc" -eq 0 ]; then
            currentservice="$sname"
            currentdevice="$sdev"
            currentmac=$(echo "$ifout" | awk '/ether/{print $2}')
        fi
    fi
done <<< "$(echo "$services")"

if [ -n "$currentservice" ]; then
    echo "$currentservice"
    echo "$currentdevice"
    echo "$currentmac"
else
    >&2 echo "Could not find current service"
    exit 1
fi

#@TODO: refactor to use combination of `route get 8.8.8.8`, `networksetup -listallhardwareports` and a lot of `grep`. Turns out this method is innacurate on reporting of service order
