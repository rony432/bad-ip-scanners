Bad IP List of IPs Scanning All Ports on Your Server

This repository contains a list of bad IPs that are scanning all ports on your server.

Usage:

Clone the repository:

```git clone https://github.com/rony432/bad-ip-scanners```

Open the crontab configuration:

```crontab -e```

Add the following line at the end of the crontab file to schedule the bad IP updater script to run daily at 2:00 AM:

```0 2 * * * /your-path/bad-ip-scanners/bad-ip-updater.sh```
