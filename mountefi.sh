
if [ "$1" == "hdd" ]; then
    diskutil mount 3C415F06-E3AE-4566-A20A-704709150268
    open  /Volumes/EFI
    echo "Done."
fi

if [ "$1" == "ssd" ]; then
    diskutil mount 1CE07B44-E284-4C43-8E60-90F39C0C6D09
    open  /Volumes/EFI
    echo "Done."
fi

if [ "$1" == "um" ]; then
    diskutil umount 3C415F06-E3AE-4566-A20A-704709150268 & diskutil umount 1CE07B44-E284-4C43-8E60-90F39C0C6D09
    echo "Done."
    
fi

echo "Hello."O

