#!/bin/bash

set -e

# Function to construct the clone command
construct_clone_command() {
    local repo_type=$1
    local repo_url=$2
    case $repo_type in
        private) echo "git clone https://${GITHUB_USER}:${GITHUB_ACCESS_TOKEN}@${repo_url#https://}" ;;
        enterprise) echo "git clone https://${ENTERPRISE_USER}:${ENTERPRISE_ACCESS_TOKEN}@${repo_url#https://} ${ENTERPRISE_ADDONS}" ;;
        public) echo "git clone $repo_url" ;;
    esac
}

# Clonar el repositorio oficial de Odoo
git clone https://github.com/odoo/odoo.git --depth 1 --branch 16.0 --single-branch --no-tags

# Clonar el repositorio de focuz Ai el Odoo Enterprise
repo_url="https://github.com/odoo/enterprise"
git clone https://${ENTERPRISE_USER}:${ENTERPRISE_ACCESS_TOKEN}@${repo_url#https://} ${ENTERPRISE_ADDONS}
# Crear el archivo cronjob
# (crontab -l ; echo "0 10 * * * cd $(pwd)/odoo && git pull") | crontab -
