# Docker Notes – Running & Stopping Containers

## 1. Running Containers
- Run Ubuntu container:
  ```bash
  docker run ubuntu
````

* Downloads the image if missing and starts it.

* By default, it tries to run and exit (no shell interaction).

* Interactive shell:

  ```bash
  docker run -it ubuntu
  ```

  * `-i` → interactive (keeps STDIN open)
  * `-t` → allocates a terminal
  * Together `-it` gives you a usable shell inside the container.
  * Exit with `exit`.

* Detached/background mode:

  ```bash
  docker run -d -it --name looper ubuntu sh -c 'while true; do date; sleep 1; done'
  ```

  * `-d` → run in background
  * `--name looper` → easy to reference later
  * Command keeps printing dates every second.

---

## 2. Managing Running Containers

* List running containers:

  ```bash
  docker container ls
  ```

* Check logs:

  ```bash
  docker logs -f looper
  ```

  (`-f` follows live logs)

* Pause/unpause:

  ```bash
  docker pause looper
  docker unpause looper
  ```

* Attach to container:

  ```bash
  docker attach looper
  ```

  * Shares container’s output with your terminal.
  * `Ctrl+C` stops the container.
  * Use `--no-stdin` if you just want to watch logs without stopping it.

* Start a stopped container:

  ```bash
  docker start looper
  ```

* Detach without stopping:

  * Shortcut: `Ctrl+P, Ctrl+Q`

---

## 3. Running Commands in a Container

* Execute a command inside a running container:

  ```bash
  docker exec looper ls -la
  ```

* Start a bash shell inside:

  ```bash
  docker exec -it looper bash
  ```

* View running processes:

  ```bash
  ps aux
  ```

---

## 4. Stopping & Removing

* Graceful stop:

  ```bash
  docker stop looper
  ```

  (sends `SIGTERM`, then `SIGKILL` after timeout)

* Force kill:

  ```bash
  docker kill looper
  ```

* Remove container:

  ```bash
  docker rm looper
  # or force remove (stop + rm)
  docker rm --force looper
  ```

* Auto-remove when finished:

  ```bash
  docker run -d --rm -it --name looper-it ubuntu sh -c 'while true; do date; sleep 1; done'
  ```

  (`--rm` cleans up container after exit)

---

## 5. Special Notes

* **Nonmatching host platform (M1/M2 Mac)**

  * Warning if image arch ≠ host arch.
  * Docker Desktop emulates via QEMU, works but slower.
  * Popular images like Ubuntu are **multi-platform** → no warning.

* **Ubuntu in a container**

  * Works just like normal Ubuntu:

    ```bash
    docker run -it ubuntu
    apt-get update
    apt-get -y install nano
    ```
  * Installed software is **not permanent** (removed when container is deleted).

---

## 6. Exercises (Summary)

1. **Secret message**

   * Image: `devopsdockeruh/simple-web-service:ubuntu`
   * Inside container:

     ```bash
     tail -f ./text.log
     ```
   * Every 10s shows a secret message.

2. **Missing dependencies**

   * Script uses `curl`, but not installed.
   * Solution: install `curl` in running container:

     ``` bash
     apt-get update
     apt-get install -y curl
     ```

