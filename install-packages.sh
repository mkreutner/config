#!/bin/bash

# create file which contains packages list
#  $ dpkg-query -f '${binary:Package}\n' -W > /media/sdcard/installed-packages-del-e5470
# then execute:
xargs sudo apt-get install </media/sdcard/installed-packages-del-e5470
