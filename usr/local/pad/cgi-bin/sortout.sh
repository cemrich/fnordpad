#!/bin/bash
###########################################################################################
### Skript zum Löschen von in einer Gruppe vorhandenen Bildern aus einer zweiten Gruppe ###
###########################################################################################

#Fehlerkontrolle der übergebeneb Gruppe wäre schön... (Known bug)

#Config File laden
source /usr/local/pad/etc/pad.cfg

#Inhalt des gewünschten Gruppen Files laden
group=$(cat $groupdir$1)

#Bilder innerhalb der Gruppe aus der neupic gruppe löschen
while read -r line
do
 cat $groupdir$2 | sed "s/${line}//g" > $groupdir$2
done <<<"$group"


