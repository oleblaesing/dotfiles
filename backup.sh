zip -r backup.zip ~/Documents ~/Keys
gpg -c backup.zip
rm backup.zip
sudo mkdir -p /mnt/backup
sudo mount /dev/sdc1 /mnt/backup
sudo cp backup.zip.gpg /mnt/backup/
rm backup.zip.gpg
sudo umount /mnt/backup
sudo eject /dev/sdc1
