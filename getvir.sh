#!/bin/bash
#BIDLO_SCRIPT
#version 0.05
for n in $1
do
FIND_HOST=`grep "$1" /etc/httpd/conf/httpd.conf |  grep "DocumentRoot" | awk '{print $2}'`
FIND_VIR1=`echo "$FIND_HOST" | xargs -i find "{}" -name '*.php' | xargs grep -l "eval(base64_decod"`
FIND_VIR2=`echo "$FIND_HOST" | xargs -i find "{}" -name '*.php' | xargs grep -l "preg_replace(\"\/"`
FIND_VIR3=`echo "$FIND_HOST" | xargs -i find "{}" -name '*.php' | xargs grep "eval" | grep "_REQUEST" | awk -F ":" '{print $1}'`

  echo -e "Hight Level: "
  echo -e "$FIND_VIR1"
  echo -e "$FIND_VIR3"
  echo -e " "
  echo -e "Medium Level: "
  echo -e "$FIND_VIR2"

done
