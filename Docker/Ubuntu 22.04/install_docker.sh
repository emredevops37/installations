#!/bin/bash

# Docker Kurulum Scripti - Ubuntu 22.04
# Kullanım: sudo ./install_docker.sh

set -e # Hata durumunda scripti durdur

# Root kontrolü
if [ "$(id -u)" -ne 0 ]; then
    echo "Bu script root yetkisi gerektirir. Lütfen sudo ile çalıştırın."
    exit 1
fi

# Güncellemeleri yap
echo "Sistem güncellemeleri yapılıyor..."
apt-get update -qq

# Gerekli bağımlılıkları kur
echo "Temel bağımlılıklar yükleniyor..."
apt-get install -qq -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker'ı resmi script ile kur
echo "Docker kurulumu başlatılıyor..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Docker servisini başlat ve etkinleştir
echo "Docker servisi yapılandırılıyor..."
systemctl start docker
systemctl enable docker

# Docker Compose kurulumu (plugin versiyonu)
echo "Docker Compose yükleniyor..."
apt-get install -qq -y docker-compose-plugin

# Mevcut kullanıcıyı docker grubuna ekle ve grup değişikliğini aktif et
echo "Kullanıcı docker grubuna ekleniyor..."
CURRENT_USER=$(who am i | awk '{print $1}')
usermod -aG docker $CURRENT_USER

# Grup değişikliğini aktif etmek için newgrp komutu
echo "Grup değişiklikleri aktif ediliyor..."
su - $CURRENT_USER -c "newgrp docker"

# Temizlik
rm -f get-docker.sh

echo -e "\nDocker başarıyla kuruldu!\n"
echo "Aşağıdaki komutla test edebilirsiniz:"
echo "  docker run hello-world"
echo ""
echo "NOT: Eğer hala 'permission denied' hatası alıyorsanız, oturumu kapatıp açmayı deneyin."