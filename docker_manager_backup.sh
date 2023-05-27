#!/bin/bash

#sudo apt-get install p7zip-full
# Создаем резервную копию
cd /home/volokzhanin/docker/docker_manager/
tar cvpzf /mnt/backup/backup/docker_manager/"$(date '+%Y-%m-%d').tar.gz" ./
7za a -tzip -p$ARCHIVE_DOCKER_MANAGER -mem=AES256  /mnt/backup/backup/docker_manager/"$(date '+%Y-%m-%d').zip" /mnt/backup/backup/docker_manager/"$(date '+%Y-%m-%d').tar.gz"
rm /mnt/backup/backup/docker_manager/"$(date '+%Y-%m-%d').tar.gz"
# Удаляем архивы резервной копии старше n дней
find /mnt/backup/backup/docker_manager/ -mtime +0 -type f -delete

# restore
# 7za e /mnt/backup/backup/docker_manager/2021-10-09.zip
# cd /home/volokzhanin/docker/docker_manager/ & tar xpvzf /mnt/backup/backup/docker_manager/2021-10-09.tar.gz