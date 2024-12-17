#!/bin/bash

log_file="$1"

echo -e "\nTop 5 IP request with the most requests: "
awk '{print $1}' nginx-access.log | sort -n | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s\n", $2, $1}'

echo -e "\nTop 5 most requested paths: "
awk '{print $7}' nginx-access.log | sort -n | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s\n", $2, $1}'

echo -e "\nTop 5 status request code: "
awk '{print $9}' nginx-access.log | sort -n | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s\n", $2, $1}'
