#!/bin/bash

## Variablen
#Speicherort der Datei für neue Bilder
 newp=/var/www/bilder_neu
# Zielordner der Bilder
 ordner=/var/www/bilder/
# Adressen der soups
 suppe=("http://fnordpad.soup.io/rss" "http://sixtus.soup.io/rss" "http://fotochaoten.soup.io/rss" "http://kochchaoten.soup.io/rss" "http://gnd.soup.io/rss")

cd $ordner       
for ((i=0; i<=`echo ${#suppe[@]}`-1; i++))
do
	url=$( curl -s ${suppe[$i]} | grep -o '<enclosure [^>]*>' | grep -o 'http://[^\"]*' | awk '{ sub(/_400/, ""); print }' | awk '{ sub(/.jpeg/, ".jpg"); print }')

 while read -r line
 do
  if [ ! -f "${line##*/}" ] ; then
   #echo foblah >> 
   wget -q $line
   echo ${line##*/} >> $newp
  fi
 done <<<"$url"

done





