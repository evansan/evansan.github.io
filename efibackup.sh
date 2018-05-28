#!/bin/bash

read -p "Back up description:" desc

time=`date +%Y-%m-%d`


efiguid=`bdmesg | grep  " self device " | grep -o ........-....-....-....-............`
echo "Get Booted EFI Partition's GUID"

diskutil mount $efiguid

efidir=`diskutil info  $efiguid | grep  /Volumes/EFI | tail -c 15 |  sed 's/^ *//g'`
echo "Get EFI's mount point"

cd $efidir

tar -czvf /Users/wei/Desktop/$time-$desc.tar.gz EFI

sleep 1

diskutil umount $efiguid

exit 0
