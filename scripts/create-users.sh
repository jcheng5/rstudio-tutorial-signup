#!/bin/bash

set -e

cd $(dirname $0)

if [ -f ../passwords.txt ]; then
  echo "Error: passwords.txt already exists" >&2
  exit 1
fi

for i in {1000..1999}; do
  adduser --disabled-password --gecos "" guest$i
  PASSWORD=`pwgen`
  echo "guest$i,$PASSWORD" >> ../passwords.txt
  echo "guest$i:$PASSWORD" | chpasswd
  mkdir -p /home/guest$i/.rstudio/projects_settings
  #echo -n "/home/guest$i/user2016-tutorial-shiny/user2016-tutorial-shiny.Rproj" > /home/guest$i/.rstudio/projects_settings/switch-to-project
done
