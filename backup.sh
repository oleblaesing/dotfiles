zip -r backup.zip ~/Documents ~/Keys
gpg -c backup.zip
rm backup.zip
mv backup.zip.gpg /run/media/solitude/UNTITLED/
umount /run/media/solitude/UNTITLED/
