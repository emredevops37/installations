📥 Kurulum

Scripti doğrudan çalıştırmak için:
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/emredevops37/installations/refs/heads/main/Docker/Ubuntu%2022.04/install_docker.sh)"
```
Veya önce indirip sonra çalıştırabilirsiniz:
```
curl -O https://raw.githubusercontent.com/emredevops37/installations/refs/heads/main/Docker/Ubuntu%2022.04/install_docker.sh
sudo bash install_docker.sh
rm install_docker.sh
```

✔️ Doğrulama
Kurulumun başarılı olduğunu kontrol etmek için:
```
docker --version
docker run hello-world
```