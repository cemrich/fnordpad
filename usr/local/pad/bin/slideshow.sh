# Wird beim Autologin gestartet #
#!/bin/bash

source /usr/local/pad/etc/pad.cfg
cd $picdir
pic_sfw=pic_sfw

pics=$(cat $groupdir$pic_sfw)

fbi -u -T vt01 -t 10 --autodown --noverbose $pics
