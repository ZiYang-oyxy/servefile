#!/bin/bash

db_dir=~/.ad_database

killall servefile
mkdir -p $db_dir
nohup servefile -u -a Awesome:Devops --realm ad -p 8889 -4 $db_dir >/dev/null 2>&1 &
sleep 1
nohup servefile -l -a Awesome:Devops --realm ad -p 8890 -4 $db_dir >/dev/null 2>&1 &
sleep 2
