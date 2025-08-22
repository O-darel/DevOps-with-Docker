#!/bin/bash

while true
do  

    echo "Enter website url or type type exit to quit: "
    read webUrl;

    if [[ "$webUrl" == "exit" ]]; then
        echo "GoodBye"
        break
    fi
    
    if [[ "$webUrl" != http* ]]; then
        webUrl="http://$webUrl"
    fi

    echo "Searching $webUrl";
    sleep 1;
    curl  $webUrl
done