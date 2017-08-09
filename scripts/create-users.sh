#!/bin/bash

set -e

PREFIX=dash
#PROJECT=rstudio2017-shiny-tutorial

cd $(dirname $0)

if [ -f ../passwords.txt ]; then
  echo "Error: passwords.txt already exists" >&2
  exit 1
fi

for i in {1000..1300}; do
  USERNAME=$PREFIX$i
  adduser --disabled-password --gecos "" $USERNAME
  PASSWORD=`pwgen`
  echo "$USERNAME,$PASSWORD" >> ../passwords.txt
  echo "$USERNAME:$PASSWORD" | chpasswd
  #mkdir -p /home/$USERNAME/.rstudio/projects_settings
  #echo -n "/home/$USERNAME/$PROJECT/$PROJECT.Rproj" > /home/$USERNAME/.rstudio/projects_settings/switch-to-project
  #chown -R $USERNAME:$USERNAME /home/$USERNAME/.rstudio
done
