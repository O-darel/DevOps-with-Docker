# Docker Basics

## Running Containers
```bash
docker container run hello-world
# or
docker run hello-world
````

## Download Images Without Running

```bash
docker image pull hello-world
```

## List Images

```bash
docker image ls
```

## List Containers

```bash
docker container ls
# Without -a flag, it only shows running containers
docker container ls -a
# Short form:
docker ps
```

### Filtering with `grep`

```bash
docker container ls -a | grep hello-world
```

## Remove Containers

```bash
docker container rm <id>
# Remove multiple containers
docker container rm id1 id2 id3
```

## Delete Stopped Containers

```bash
docker container prune
```

## Delete Dangling Images

*Dangling images are untagged images not in use.*

```bash
docker image prune
```

## Run Containers in Detached Mode

*Runs in the background.*

```bash
docker run -d nginx
```

## Stop Containers

*You cannot remove running containers without stopping them first.*

```bash
docker container stop <container>
```

---

## Common Docker Commands

| Command                             | Explanation                                   | Shorthand       |
| ----------------------------------- | --------------------------------------------- | --------------- |
| `docker image ls`                   | Lists all images                              | `docker images` |
| `docker image rm <image>`           | Removes an image                              | `docker rmi`    |
| `docker image pull <image>`         | Pulls image from Docker registry              | `docker pull`   |
| `docker container ls -a`            | Lists all containers                          | `docker ps -a`  |
| `docker container run <image>`      | Runs a container from an image                | `docker run`    |
| `docker container rm <container>`   | Removes a container                           | `docker rm`     |
| `docker container stop <container>` | Stops a container                             | `docker stop`   |
| `docker container exec <container>` | Executes a command inside a running container | `docker exec`   |

