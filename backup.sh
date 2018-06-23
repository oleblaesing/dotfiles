zip -r backup.zip ~/Documents ~/Keys
gpg -c backup.zip
rm backup.zip
cp backup.zip.gpg /Volumes/UNTITLED/
rm backup.zip.gpg
diskutil unmountDisk /Volumes/UNTITLED/
