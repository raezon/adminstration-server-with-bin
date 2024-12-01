#!/bin/bash

# Mise à jour du système
echo "Mise à jour du système..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Installation d'un GUI léger (Xfce)
echo "Installation de l'environnement graphique Xfce..."
sudo apt-get install -y xfce4 xfce4-goodies lightdm

# Installation de Bind (DNS)
echo "Installation de Bind..."
sudo apt-get install -y bind9 bind9utils bind9-doc

# Installation de Nginx
echo "Installation de Nginx..."
sudo apt-get install -y nginx

# Démarrage des services
echo "Activation des services..."
sudo systemctl enable lightdm
sudo systemctl enable bind9
sudo systemctl enable nginx

echo "Tous les services sont installés et configurés."
