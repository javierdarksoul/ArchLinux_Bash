#!/bin/bash
wifi-menu
fdisk -l
read -p "Ingrese unidad en la que instalara Arch linux: " UNIDAD
cfdisk /dev/$UNIDAD
read -p "Ingrese unidad EFI: " EFI
read -p "Ingrese unidad SWAP: " SWAP
read -p "Ingrese unidad RAIZ: " RAIZ
mkfs.vfat -F32 /dev/$EFI
mkfs.ext4 /dev/$RAIZ
mkswap /dev/$SWAP
swapon /dev/$SWAP
mount /dev/$RAIZ /mnt
mkdir -p /mnt/boot/efi
mount /dev/$EFI /mnt/boot/efi
pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs
pacstrap /mnt netctl wpa_supplicant dialog grub
genfstab -pU /mnt >> /mnt/etc/fstab
cp /run/archiso/bootmnt/paso2.sh /mnt
cp /run/archiso/bootmnt/paso3.sh /mnt
cp /run/archiso/bootmnt/config.sh /mnt
( echo "sh paso2.sh" ) | arch-chroot /mnt
umount -R /mnt
echo "Reiniciando en 5 segundos..."
sleep 5
reboot now
