# 4 - Docker setup and demo

Within the VM created in [step 2](./2-virtual-machine-setup.md), we will install Docker and run a demo container inside.

## Setup Docker

```bash
curl https://get.docker.com -o get_docker.sh
chmod +x get_docker.sh
./get_docker.sh
sudo usermod -aG docker $USER
# logout and login
```

## Run Hello {Name} app

Credits: <https://github.com/julie-ng/hello-welt>

```bash
docker run -p 8080:3000 -e HELLO_NAME=Stamatis julieio/hello:latest
```

## Validation

From our laptop, with the SSH connection still open, we open the browser in: <http://localhost:8080>.

![docker-demo](images/docker-demo-app.png)
