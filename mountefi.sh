#!/bin/bash
if [ "$1" == "hdd" ]; then
    diskutil mount 3C415F06-E3AE-4566-A20A-704709150268
	hddir=`diskutil info 3C415F06-E3AE-4566-A20A-704709150268 | grep  /Volumes/EFI | tail -c 15 |  sed 's/^ *//g'`
    open  "$hddir"
    echo "Done."
fi

if [ "$1" == "ssd" ]; then
    diskutil mount 1CE07B44-E284-4C43-8E60-90F39C0C6D09
	ssddir=`diskutil info 1CE07B44-E284-4C43-8E60-90F39C0C6D09 | grep  /Volumes/EFI | tail -c 15 |  sed 's/^ *//g'`
    open "$ssddir"
    echo "Done."
fi

if [ "$1" == "um" ]; then
    diskutil umount 3C415F06-E3AE-4566-A20A-704709150268
	diskutil umount 1CE07B44-E284-4C43-8E60-90F39C0C6D09
    echo "Done."

fi
