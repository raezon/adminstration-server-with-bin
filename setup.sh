#!/bin/bash

# Mise à jour du système
echo "Mise à jour du système..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Installation de l'environnement graphique Xfce
echo "Installation de l'environnement graphique Xfce..."
sudo apt-get install -y xfce4 xfce4-goodies lightdm

# Configuration du clavier en français
echo "Configuration du clavier en français..."
sudo localectl set-x11-keymap fr
sudo loadkeys fr

# Création de l'utilisateur 'ammar' avec mot de passe par défaut
echo "Création de l'utilisateur 'ammar'..."
sudo useradd -m -s /bin/bash ammar
echo "ammar:ammar" | sudo chpasswd

# Ajout de l'utilisateur 'ammar' au groupe sudo
echo "Ajout de l'utilisateur 'ammar' au groupe sudo..."
sudo usermod -aG sudo ammar

# Configuration dans sudoers pour permettre l'utilisation de sudo sans mot de passe
echo "Ajout explicite de 'ammar' dans sudoers..."
echo "ammar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ammar > /dev/null
sudo chmod 440 /etc/sudoers.d/ammar

# Installation de Bind (DNS)
echo "Installation de Bind (DNS)..."
sudo apt-get install -y bind9 bind9utils bind9-doc

# Installation de Nginx
echo "Installation de Nginx..."
sudo apt-get install -y nginx

# Activation des services
echo "Activation des services..."
sudo systemctl enable lightdm
sudo systemctl enable bind9
sudo systemctl enable nginx

# Copie du script dans /usr/local/bin (ou /usr/bin) et attribution des permissions d'exécution
echo "Copie du script dans /usr/local/bin/setup-bind-nginx.sh et attribution des permissions d'exécution..."
sudo cp /vagrant/setup-bind-nginx.sh /usr/local/bin/setup-bind-nginx.sh
sudo chmod +x /usr/local/bin/setup-bind-nginx.sh


# Copie du script dans /usr/local/bin (ou /usr/bin) et attribution des permissions d'exécution
echo "Copie du script dans /usr/local/bin/setup-web-app.sh et attribution des permissions d'exécution..."
sudo cp /vagrant/setup-web-app.sh /usr/local/bin/setup-web-app.sh
sudo chmod +x /usr/local/bin/setup-web-app.sh


echo "Configuration terminée !"
echo "Vous pouvez vous connecter avec l'utilisateur suivant :"
echo "Nom d'utilisateur : ammar"
echo "Mot de passe : ammar"
