# from 7techlife/sevenhy2, yet added ssh server

Now hy2 is at 7777
SSH server is at port 22


Test:
```
docker run -e SSH_PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)" -p 2222:22 -p 7777:7777 -e password=changeme nightlybible/hysteria
```
