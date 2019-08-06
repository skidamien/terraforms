#!/bin/bash

IP_FILE="~/public_ip.txt"
echo "The public IP will be saved to $IP_FILE" 
curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/12:31:39:02:14:35/public-ipv4s > $IP_FILE

