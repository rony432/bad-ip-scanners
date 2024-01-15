#!/bin/bash

# Specify the GitHub raw text file URL
github_raw_url="https://raw.githubusercontent.com/rony432/bad-ip-scanners/main/blocklist.txt"

# Specify the local file to store the downloaded blocklist
local_file="blocklist.txt"

# Download the blocklist from GitHub
if command -v curl &> /dev/null; then
    curl -sS "$github_raw_url" -o "$local_file"
elif command -v wget &> /dev/null; then
    wget -q "$github_raw_url" -O "$local_file"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

# Check if the download was successful
if [ ! -s "$local_file" ]; then
    echo "Error: Unable to download the blocklist."
    exit 1
fi

# Block IPs using UFW
while read -r ip; do
    sudo ufw deny from $ip to any
done < "$local_file"

# Reload UFW to apply the changes
sudo ufw reload

echo "IP blocking completed successfully."
