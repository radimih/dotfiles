# keyboard

Настройка клавиатуры.

## [interception](https://gitlab.com/interception/linux/tools)

Переопределить `Space` -> `Meta` не удаётся с помощью плагина `dual-function-keys`,
так как почему-то одиночное нажатие на `Space` отрабатывается как `Meta`.

```bash
$ cat <<EOF | docker build -t interception-builder -
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git build-essential cmake libudev-dev libyaml-cpp-dev libevdev-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /src

RUN git clone https://gitlab.com/interception/linux/tools
RUN git clone https://gitlab.com/interception/linux/plugins/dual-function-keys
RUN git clone https://gitlab.com/interception/linux/plugins/space2meta

# Прилинковать библиотеку yaml-cpp статически, чтобы итоговые бинарники не зависили
# от пакета libyaml-cpp-dev
RUN sed -i 's/yaml-cpp/yaml-cpp.a/g' tools/CMakeLists.txt \
 && sed -i '/LDFLAGS/s/-lyaml-cpp/-l:libyaml-cpp.a/g' dual-function-keys/config.mk

WORKDIR tools/build
RUN cmake .. && make
WORKDIR /src/dual-function-keys
RUN make
WORKDIR /src/space2meta/build
RUN cmake .. && make

WORKDIR /src
RUN echo "#!/bin/bash" > /to_target.sh \
 && echo "cp tools/build/{intercept,udevmon,uinput} /target" >> /to_target.sh \
 && echo "cp dual-function-keys/dual-function-keys /target" >> /to_target.sh \
 && echo "cp space2meta/build/space2meta /target" >> /to_target.sh \
 && chmod 755 /to_target.sh

CMD /to_target.sh
EOF 
$ cd files
$ docker run -t --rm -v `pwd`:/target interception-builder
```
