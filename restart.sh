#!/bin/bash -x

db_dir=~/.ad_database
upload_port=8889

killall servefile
mkdir -p $db_dir
nohup servefile -u -a Awesome:Devops -p $upload_port -4 $db_dir >/dev/null 2>&1 &
sleep 1
nohup servefile -l -a Awesome:Devops -p $((upload_port+1)) -4 $db_dir >/dev/null 2>&1 &
sleep 1
ps aux | grep servefile
