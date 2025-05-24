#!/bin/bash

#C:\Users\Gary.DESKTOP-J47QPHF\Downloads\pihole-lists
#cron job to do this daily

#curl download all the individual lists
        curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts --output /home/gmr2048/Documents/PiHole/outfiles/StevenBlackHosts.txt
        curl https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt --output /home/gmr2048/Documents/PiHole/outfiles/simple_tracking.txt
        curl https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt --output /home/gmr2048/Documents/PiHole/outfiles/simple_ad.txt
        curl https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt --output /home/gmr2048/Documents/PiHole/outfiles/ads-and-tracking-extended.txt
        curl https://v.firebog.net/hosts/static/w3kbl.txt --output /home/gmr2048/Documents/PiHole/outfiles/w3kbl.txt
        curl https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt --output /home/gmr2048/Documents/PiHole/outfiles/AntiMalwareHosts.txt
        curl https://v.firebog.net/hosts/RPiList-Malware.txt --output /home/gmr2048/Documents/PiHole/outfiles/RPiList-Malware.txt
        curl https://v.firebog.net/hosts/RPiList-Phishing.txt --output /home/gmr2048/Documents/PiHole/outfiles/RPiList-Phishing.txt
        curl https://v.firebog.net/hosts/Admiral.txt --output /home/gmr2048/Documents/PiHole//outfiles/Admiral.txt
        curl https://v.firebog.net/hosts/Prigent-Malware.txt --output /home/gmr2048/Documents/PiHole/outfiles/Prigent-Malware.txt
        curl https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.plus.txt --output /home/gmr2048/Documents/PiHole/outfiles/hagezi-pro.plus.txt
        curl https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/tif.txt --output /home/gmr2048/Documents/PiHole/outfiles/hagezi-tif.txt
        curl https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.tiktok.txt  --output /home/gmr2048/Documents/PiHole/outfiles/hagezi-tiktok.txt

#combine lists, remove dupes and blank lines, remove all comment lines, (not doing: split into 1B line files)
        cat /home/gmr2048/Documents/PiHole/outfiles/*.txt | grep -v '^\s*$' | sort -u | sed '/^#/d' | split -l1000000000 - /home/gmr2048/Documents/PiHole/outfiles/outfile_

#clean up source text files
        rm /home/gmr2048/Documents/PiHole/outfiles/*.txt
