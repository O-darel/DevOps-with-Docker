# Docker Basics – Images

## What Are Images?

* Core building blocks for containers.
* Containerizing an app = creating its image.

---

## Where Do Images Come From?

If missing locally → Docker pulls from **Docker Hub** by default.

Example:

  ```bash
  docker run hello-world
  docker run postgres
  ```

Search images:

  ```bash
  docker search hello-world
  ```

### Official vs Non-Official Images

* **Official**: No prefix, `[OK]` tag, actively maintained (e.g., `ubuntu`).
* **Non-official**: User/org prefix (e.g., `rancher/hello-world`), may be unmaintained.

### Other Registries

*Example: **Quay.io**

  ```bash
  docker pull quay.io/nordstrom/hello-world:2.0
  ```
*If registry not specified → defaults to Docker Hub.

---

## Tags & Versions

*Format:

  ```
  registry/organisation/image:tag
  ```

  Example: `ubuntu:25.04`

*Defaults: registry → Docker Hub, org → library, tag → latest.

*Local tagging:

  ```bash
  docker tag ubuntu:25.04 ubuntu:noble_numbat
  docker tag ubuntu:25.04 fav_distro:noble_numbat
  ```

---

## Image Layers

*Images consist of multiple layers.
*Benefits:

  * Parallel download → faster pulls.
  * Caching → rebuild only changed layers.
  * Saves storage when layers are reused.

---

## Building Images

### Example Script

```sh
#!/bin/sh
echo "Hello, docker!"
```

### Dockerfile

```dockerfile
FROM alpine:3.21
WORKDIR /usr/src/app
COPY hello.sh .
# RUN chmod +x hello.sh   # if script not executable
CMD ./hello.sh
```

### Build & Run

```bash
docker build . -t hello-docker
docker run hello-docker
```

---

## Modifying Images

### Copy File into Container

```bash
docker cp ./additional.txt <container_id>:/usr/src/app/
docker diff <container_id>
```

* `A` = Added, `C` = Changed, `D` = Deleted

### Save Container as New Image

```bash
docker commit <container_id> hello-docker-additional
```

⚠️ Best practice: use **Dockerfile**, not `docker commit`.

---

## Extended Dockerfile Example

```dockerfile
FROM alpine:3.21
WORKDIR /usr/src/app
COPY hello.sh .
RUN touch additional.txt
CMD ./hello.sh
```

Build:

```bash
docker build . -t hello-docker:v2
```

---

## Exercises

### **1.5 – Sizes of Images**

* Compare `simple-web-service:ubuntu` vs `:alpine`.
* Check image sizes.
* Verify both work (Alpine uses `sh`, not `bash`).

---

### **1.6 – Hello Docker Hub**

* Run:

  ```bash
  docker run -it devopsdockeruh/pull_exercise
  ```
* Find secret message in image’s Dockerfile/docs on Docker Hub.

---

### **1.7 – Image for Script**

* Create `script.sh` (reads a website and curls it).
* Build new image from `ubuntu:24.04` with `curl` installed.
* Copy script into image and set it as container’s default `CMD`.

---

### **1.8 – Two-Line Dockerfile**

* Base on `devopsdockeruh/simple-web-service:alpine`.
* Add `CMD` so it runs the web server automatically.
* Tag image as `web-server`.

---