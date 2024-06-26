#!/bin/bash -x

export PYTHONUNBUFFERED=x
db_dir=./ad_files
upload_port=8889

kill $(ps aux | grep 'servefile.py' | awk '{print $2}')
mkdir -p $db_dir
nohup ./servefile/servefile.py -u -a Awesome:Devops -p $upload_port -4 $db_dir >> @servefile_u.log@ 2>&1 &
sleep 1
nohup ./servefile/servefile.py -l -a Awesome:Devops -p $((upload_port+1)) -4 $db_dir >> @servefile_d.log@ 2>&1 &
sleep 1
ps aux | grep servefile
