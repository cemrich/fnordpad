#!/bin/bash
#################################################################
###   Script sollte ca. alle 1/2h per Cron gestartet werden   ###
### Der Feed wird geladen und Fehlende Bilder heruntergeladen ###
#################################################################

#Laden der Config Datei
source /usr/local/pad/etc/pad.cfg

#ins Bilderverzeichniss wechseln zum Herunterladen der Bilder
cd $picdir
       
for ((i=0; i<=`echo ${#suppe[@]}`-1; i++))
do
	url=$( curl -s ${suppe[$i]} | grep -o '<enclosure [^>]*>' | grep -o 'http://[^\"]*' | awk '{ sub(/_400/, ""); print }' | awk '{ sub(/.jpeg/, ".jpg"); print }')

 while read -r line
 do
  if [ ! -f "${line##*/}" ] ; then
   wget -q $line
   echo ${line##*/} >> $groupdir$newpicgroup
  fi
 done <<<"$url"

done





