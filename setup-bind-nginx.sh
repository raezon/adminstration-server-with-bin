#!/bin/bash

# Définir les répertoires pour les configurations Nginx
NGINX_CONF_DIR="/etc/nginx/sites-available"
NGINX_ENABLED_DIR="/etc/nginx/sites-enabled"

# Créer les fichiers de configuration Nginx pour chaque domaine
echo "Création des fichiers de configuration Nginx..."

# Configuration pour dep-informatique.com
echo "server {
    listen 80;
    server_name dep-informatique.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee $NGINX_CONF_DIR/dep-informatique.com > /dev/null

# Configuration pour dep-management.com
echo "server {
    listen 80;
    server_name dep-management.com;

    location / {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee $NGINX_CONF_DIR/dep-management.com > /dev/null

# Configuration pour dep-marketing.com
echo "server {
    listen 80;
    server_name dep-marketing.com;

    location / {
        proxy_pass http://127.0.0.1:3002;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee $NGINX_CONF_DIR/dep-marketing.com > /dev/null

# Activer les fichiers de configuration Nginx
echo "Activation des sites dans Nginx..."
sudo ln -s $NGINX_CONF_DIR/dep-informatique.com $NGINX_ENABLED_DIR/
sudo ln -s $NGINX_CONF_DIR/dep-management.com $NGINX_ENABLED_DIR/
sudo ln -s $NGINX_CONF_DIR/dep-marketing.com $NGINX_ENABLED_DIR/

# Redémarrer Nginx pour appliquer les changements
echo "Redémarrage de Nginx pour appliquer les nouvelles configurations..."
sudo systemctl restart nginx

echo "La configuration de Nginx a été mise à jour avec succès."
