function bk
  zip -r backup.zip ~/Documents ~/Keys ~/Sync
  gpg -c backup.zip
  rm backup.zip
  mv backup.zip.gpg /run/media/$USER/Backup/
  umount /run/media/$USER/Backup/
end
