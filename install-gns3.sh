#!/bin/bash

echo "installing required packages..."
sudo pacman -Sy --noconfirm yay
yay -Sy --noconfirm
yay -S --noconfirm gns3-server gns3-gui dynamips ubridge qemu docker wireshark-qt vpcs libvirt gperftools tigervnc inetutils

echo "Adding user to required groups..."
sudo usermod -aG docker,wireshark,kvm,libvirt $(whoami)

echo "Enabling and starting systemd services..."
sudo systemctl enable --now docker
sudo systemctl enable --now libvirtd
sudo virsh net-autostart default

echo "GNS3 installation completed! Please reboot your system for the changes to take effect."
