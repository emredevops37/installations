Docker ortamında Nexus nasıl kurulur?

1. Host Makinede Dizin Oluşturma
Terminalde şu komutları çalıştırın:

```
# Dizin oluştur
sudo mkdir -p /data/nexus

# Nexus container'ının yazabilmesi için izinleri ayarla (UID 200 kullanır)
sudo chown -R 200:200 /data/nexus

# İzinleri kontrol et
ls -ld /data/nexus
```
beklenen çıktı:
```
drwxr-xr-x 2 200 200 4096 Tem 10 15:00 /data/nexus
```
💡 İpuçları

Disk Alanı Kontrolü:
Nexus zamanla çok veri biriktirebilir. Düzenli olarak disk kullanımını kontrol edin:
```
df -h /data
```
Yedekleme:
Host path kullandığınız için yedekleme çok kolay:
```
tar -czvf nexus_backup.tar.gz /data/nexus
```




