# keyd

Переопределение поведения некоторых клавиш с помощью [keyd](https://github.com/rvaiya/keyd):

| Клавиша | Однократное нажатие | На удержании |
|:-------:|:-------------------:|:------------:|
| `CapsLock` | `ESC` | `Left Ctrl`
| `Enter` | `Enter` | `Right Ctrl`
| `Space` | `Space` | `Meta`
| `Tab` | `Tab` | _Vim-mode_ (клавиши `h`, `j`, `k`, `l`</br>действуют как стрелки)
| `Left Shift` | `Left Alt + F11` | `Left Shift`
| `Right Shift` | `Left Alt + F12` | `Right Shift`

## Сборка keyd

```bash
$ cat <<EOF | docker build -t keyd-builder -
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git build-essential \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /src

RUN git clone https://github.com/rvaiya/keyd .

RUN make

RUN echo "#!/bin/bash" > /to_target.sh \
 && echo "cp bin/keyd /target" >> /to_target.sh \
 && chmod 755 /to_target.sh

CMD /to_target.sh
EOF 
$ cd files/bin
$ docker run -t --rm -v `pwd`:/target keyd-builder
```
