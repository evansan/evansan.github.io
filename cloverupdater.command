#!/bin/bash
cd /tmp/
echo "Going to temp directory"

dnlink=`curl -s https://api.github.com/repos/dids/clover-builder/releases/latest | grep -Eo "https?://\S+?\.pkg" | head -n 1`
echo "Get the lastest download link"

efiguid=`bdmesg | grep  " self device " | grep -o ........-....-....-....-............`
echo "Get Booted EFI Partition's GUID"

aria2c -x 2 $dnlink 
echo "Download the pkg file"

pkgutil --expand *.pkg ./pkg
echo "Expand the pkg file"

cd /tmp/pkg/EFIFolder.pkg
echo "Change directory into EFIFolder.pkg"

tar xzf Payload
echo "unpacking the payload"

diskutil mount $efiguid 

efidir=`diskutil info  $efiguid | grep  /Volumes/EFI | tail -c 15 |  sed 's/^ *//g'`
echo "Get EFI's mount point"

cp /tmp/pkg/EFIFolder.pkg/EFI/BOOT/BOOTX64.efi $efidir/EFI/BOOT/
echo "Copy BOOTX64.efi to /Volumes/EFI/EFI/BOOT/"
cp /tmp/pkg/EFIFolder.pkg/EFI/CLOVER/CLOVERX64.efi $efidir/EFI/CLOVER/
echo "Copy CLOVERX64.efi to /Volumes/EFI/EFI/CLOVER/"

diskutil umount $efiguid

rm /tmp/Clover_*.pkg
echo "Remove the pkg file"
rm -R /tmp/pkg/
echo "Remove the pkg folder"
exit 0
