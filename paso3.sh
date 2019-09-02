#!/bin/bash
sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service
read -p "Ingrese SSID: " SSID
read -p "Ingrese contraseña: " WPASS 
sudo nmcli dev wifi connect $SSID password $WPASS
sudo pacman -Syyu
sudo pacman -S --noconfirm xorg-server xorg-xinit
sudo pacman -S --noconfirm mesa
sudo pacman –S --noconfirm gnome
sudo pacman –S --noconfirm gnome-extra
sudo pacman -S --noconfirm gdm
sudo systemctl enable gdm.service
echo "Reiniciando en 5 seg"
sleep 5
reboot now
