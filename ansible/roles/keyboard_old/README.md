# keyboard

Настройка клавиатуры:

* переопределение некоторых клавиш с помощью [interception](https://gitlab.com/interception/linux/tools) и его плагинов:
  * **CapsLock**: однократное нажатие - **ESC**, на удержании - **Left Ctrl**
  * **Enter**: однократное нажатие - **Enter**, на удержании - **Right Ctrl**
  * **Space**: однократное нажатие - **Space**, на удержании - **Left Meta**
  * **Left Shift**: однократное нажатие - **Left Alt + F11** (для переключения раскладки), на удержании - **Left Shift**
  * **Right Shift**: однократное нажатие - **Left Alt + F12** (для переключения раскладки), на удержании - **Right Shift**

* определение _немодальных_ переключателей раскладок клавиатуры с помощью [xbindkeys](https://wiki.archlinux.org/index.php/Xbindkeys_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)):
  * **Left Shift** (**Left Alt + F11**) - на латиницу
  * **Right Shift** (**Left Alt + F12**) - на кириллицу

## interception

Переопределить **Space** → **Meta** с помощью плагина `dual-function-keys`  не удаётся,
так как одиночное нажатие на **Space** отрабатывает как **Meta**.
Поэтому для этой цели используется плагин `space2meta`.

Собрать бинарные файлы:

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
$ cd files/bin
$ docker run -t --rm -v `pwd`:/target interception-builder
```

## xbindkeys

По причине того, что **xbindkeys** уже при _нажатии_, а не при отпускании отрабатывает
заданную для клавиши команду, невозможно привязать какую-либо команду к клавише-модификатору,
не "поломав" ее функцию как модификатор.

Чтобы обойти эту ситуацию, сначала с помощью **interception** переопределяется удержание
клавиши-модификатора в какую-либо редкую комбинацию клавиш, а затем с помощью
**xbindkeys** на эту комбинацию "вешается" необходимое действие.
