#!/bin/bash
##############################################################################################################
### !!Das Script ermöglicht einen externen Ordner zu migrieren. Noch wird nur ein netter user angenommen!! ###
##############################################################################################################

#Laden der Configs 
source /usr/local/pad/etc/pad.cfg

for file in $1
do

  if [ ! -f $groupdir$newpicgroup<$file ] ; then
   mv $file $picdir
   echo ${file##*/} >> $groupdir$newpicgroup
  fi

done

exit 0
