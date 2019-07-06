zip -r backup.zip ~/Documents ~/Keys
gpg -c backup.zip
rm backup.zip
mv backup.zip.gpg /media/solitude/UNTITLED/
umount /media/solitude/UNTITLED/
