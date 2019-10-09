#!/bin/bash
source "./config.sh"
echo ${NOMBREDOM} > /etc/hostname
ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
echo ${ZONAA} > /etc/locale.gen
echo LANG=${ZONA} > /etc/locale.conf
locale-gen
hwclock -w
echo KEYMAP=${KEY} > /etc/vconsole.conf
grub-install --efi-directory=/boot/efi --bootloader-id='Arch Linux' --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
useradd -m ${USERNAME}
usermod -G wheel ${USERNAME}
echo "root ALL=(ALL) ALL" > /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
( echo ${PASS}; sleep 1; echo ${PASS} ) | passwd ${USERNAME}
sleep 2
( echo ${PASS}; sleep 1; echo ${PASS} ) | passwd
