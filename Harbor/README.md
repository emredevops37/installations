🚩 Hedefimiz:

Harbor’ı container olarak kurmak
Web arayüzünden bir proje oluşturmak
Docker image push/pull işlemi yapmak

🔧 1. Gerekli Bağımlılıkları Kur (Docker + Docker Compose + OpenSSL)
Harbor’un Docker Compose ile kurulması önerilir. Bu nedenle aşağıdakiler sisteminde yüklü olmalı:
```
docker -v
docker compose version
openssl version
```

⬇️ 2. Harbor Kurulum Dosyalarını İndir (versiyonu kendinize göre güncelleyin)
```
wget https://github.com/goharbor/harbor/releases/download/v2.13.2/harbor-offline-installer-v2.13.2.tgz
tar xzvf harbor-offline-installer‑v2.13.2.tgz
cd harbor
```

🛠 3. harbor.yml Dosyasını Yapılandır
```
cp harbor.yml.tmpl harbor.yml
nano harbor.yml
```
Minimum düzenlemen gereken alanlar:

hostname: localhost
http.port: 8080 (HTTP için)
İstersen HTTPS kısmını devre dışı bırak (şimdilik)
harbor_admin_password: Harbor12345 (veya kendin belirle)

```
hostname: localhost

http:
  port: 8080

# HTTPS kısmını şimdilik yorum satırı yap (disable)
# https:
#   port: 443
#   certificate: ...
#   private_key: ...

harbor_admin_password: Harbor12345

```

🚀 4. Harbor’ı Başlat
```
./prepare
sudo docker compose up -d
```
Kurulumdan sonra tarayıcıdan şu adrese git:

http://localhost:8080

Kullanıcı adı: admin
Şifre: Harbor12345

🐳 6. Image Push Et (nginx örneği)
```
docker pull nginx:alpine
docker tag nginx:alpine localhost:8080/testproject/nginx:alpine
docker login localhost:8080
# Username: admin
# Password: Harbor12345
docker push localhost:8080/testproject/nginx:alpine










