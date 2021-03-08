#!/bin/bash
# 
# Used to quicky rebuild grub from a live-boot after windows decided to whip its dick out again
#
# $1 root-mounted partition like '/dev/sda2'
# $2 boot-efi-mounted partition like '/dev/sda1'

#sudo -i
#fdisk -l



if [[ -d "/mnt" ]]; then mkdir "/mnt"; fi
sudo mount "${1}" /mnt

if [[ -d "/mnt/boot/efi" ]]; then mkdir "/mnt/boot/efi"; fi
sudo mount "${2}" /mnt/boot/efi

sudo mount --bind /dev /mnt/dev &&
sudo mount --bind /dev/pts /mnt/dev/pts &&
sudo mount --bind /proc /mnt/proc &&
sudo mount --bind /sys /mnt/sys &&
sudo mount --bind /run /mnt/run

sudo chroot /mnt

#apt update && apt dist-upgrade
#apt install grub-efi

#grub-install /dev/sdX  # not sdXY so sda not sda2
#grub-install --recheck /dev/sdX
sudo update-grub

exit &&

sudo umount /mnt/run &&
sudo umount /mnt/sys &&
sudo umount /mnt/proc &&
sudo umount /mnt/dev/pts &&
sudo umount /mnt/dev &&
sudo umount /mnt/boot/efi &&
sudo umount /mnt


#sudo reboot
