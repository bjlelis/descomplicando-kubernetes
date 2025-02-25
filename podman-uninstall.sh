#!/bin/bash

# 1. Interromper e remover contêineres e pods em execução
echo "1. Interrompendo e removendo contêineres e pods..."
sudo podman stop $(sudo podman ps -aq)
sudo podman rm -fa
sudo podman pod rm -fa

# 2. Remover imagens e volumes
echo "2. Removendo imagens e volumes..."
sudo podman rmi -a
sudo podman volume rm -fa

# 3. Remover a configuração do Podman
echo "3. Removendo a configuração do Podman..."
rm -rf ~/.config/containers

# 4. Desinstalar o pacote Podman
echo "4. Desinstalando o pacote Podman..."
sudo apt-get purge -y podman # Para sistemas baseados em Debian/Ubuntu
# sudo yum remove -y podman # Para sistemas baseados em RHEL/CentOS/Fedora
# sudo zypper remove -y podman # Para sistemas baseados em openSUSE

# 5. Remover dependências não utilizadas (opcional)
echo "5. Removendo dependências não utilizadas..."
sudo apt-get autoremove -y # Para sistemas baseados em Debian/Ubuntu
# sudo yum autoremove -y # Para sistemas baseados em RHEL/CentOS/Fedora
# sudo zypper autoremove -y # Para sistemas baseados em openSUSE

echo "Desinstalação do Podman concluída!"
