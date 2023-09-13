#!/bin/bash

# Check if an IP address is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IP address>"
    exit 1
fi

# Ping the IP address
ping -c 1 "$1"

# Check the exit code of the ping command
if [ $? -eq 0 ]; then
    # SSH into the IP address
    ssh "$1"
else
    echo "Ping to $1 failed."
fi
