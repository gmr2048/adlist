#!/bin/sh

#C:\Users\Gary.DESKTOP-J47QPHF\Downloads\pihole-lists
#cron job to do this dialy

#curl download all the individual lists
	curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts --output ./StevenBlackHosts.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt --output ./simple_tracking.txt
	curl https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt --output ./simple_ad.txt
	curl https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt --output ./ads-and-tracking-extended.txt
	curl https://v.firebog.net/hosts/static/w3kbl.txt --output ./w3kbl.txt 
	curl https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt --output ./AntiMalwareHosts.txt
	curl https://v.firebog.net/hosts/RPiList-Malware.txt --output ./RPiList-Malware.txt 
	curl https://v.firebog.net/hosts/RPiList-Phishing.txt --output ./RPiList-Phishing.txt
	curl https://v.firebog.net/hosts/Admiral.txt --output ./Admiral.txt 
	curl https://v.firebog.net/hosts/Prigent-Malware.txt --output ./Prigent-Malware.txt

#combine lists, remove dupes and blank lines, remove all comment lines, split into 750k line files
	cat ./*.txt | grep -v '^\s*$' | sort -u | sed '/^#/d' | split -l750000 - outfile_

#clean up source text files
	rm ./*.txt

#upload here:
	#git push -f origin master
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile1_aa
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ab
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ac
	#https://raw.githubusercontent.com/gmr2048/adlist/main/outfile2_ad	future growth