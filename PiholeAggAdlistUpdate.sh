#!/bin/bash

#C:\Users\Gary.DESKTOP-J47QPHF\Downloads\pihole-lists
#cron job to do this daily

echo "curl download"
#curl download all the individual lists
	curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts --output /home/gmr2048/Documents/PiHole/StevenBlackHosts.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt --output /home/gmr2048/Documents/PiHole/simple_tracking.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt --output /home/gmr2048/Documents/PiHole/simple_ad.txt
	curl https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt --output /home/gmr2048/Documents/PiHole/ads-and-tracking-extended.txt
	curl https://v.firebog.net/hosts/static/w3kbl.txt --output /home/gmr2048/Documents/PiHole/w3kbl.txt
	curl https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt --output /home/gmr2048/Documents/PiHole/AntiMalwareHosts.txt
	curl https://v.firebog.net/hosts/RPiList-Malware.txt --output /home/gmr2048/Documents/PiHole/RPiList-Malware.txt
	curl https://v.firebog.net/hosts/RPiList-Phishing.txt --output /home/gmr2048/Documents/PiHole/RPiList-Phishing.txt
	curl https://v.firebog.net/hosts/Admiral.txt --output /home/gmr2048/Documents/PiHole/Admiral.txt
	curl https://v.firebog.net/hosts/Prigent-Malware.txt --output /home/gmr2048/Documents/PiHole/Prigent-Malware.txt

echo "combine lists"
#combine lists, remove dupes and blank lines, remove all comment lines, split into 750k line files
	cat /home/gmr2048/Documents/PiHole/*.txt | grep -v '^\s*$' | sort -u | sed '/^#/d' | split -l400000 - outfile_

echo "clean up"
#clean up source text files
	rm /home/gmr2048/Documents/PiHole/*.txt

#upload here:
	#git push -f origin master
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile1_aa
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ab
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ac
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ad

cd /home/gary/Documents/PiHole/adlist

echo "git add"
git add .

echo "git commit"
git commit -m "Add existing file"

#log in to git

echo "git push"
git push origin main

#username gmr2048
#use personal access token "take2"

#git push origin adlist
#git push origin main
echo "Done!"
