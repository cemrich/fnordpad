#!/bin/bash

## Variablen
# Zielordner der Bilder
 ordner=$HOME/suppe/bilder
# Adressen der soups
 suppe=("http://fnordpad.soup.io/rss" "http://sixtus.soup.io/rss" "http://fotochaoten.soup.io/rss" "http://kochchaoten.soup.io/rss" "http://gnd.soup.io/rss")

cd $ordner

for ((i=0; i<=`echo ${#suppe[@]}`-1; i++))
do
	url=$( curl -s ${suppe[$i]} | grep -o '<enclosure [^>]*>' | grep -o 'http://[^\"]*' | awk '{ sub(/_400/, ""); print }' | awk '{ sub(/.jpeg/, ".jpg"); print }')

 while read -r line
 do
  if [ ! -f "${line##*/}" ] ; then
   wget -q $line
  fi
 done <<<"$url"

done





