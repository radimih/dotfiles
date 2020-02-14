# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Первоначальная установка на новую систему

1. Установить минимальный набор пакетов:

   ```bash
   $ sudo apt install -y xclip git
   ```

1. Настроить глобальную идентификацию пользователя в git:

   ```bash
   git config --global user.email "radimir.com@gmail.com"
   git config --global user.name "Radimir Mikhailov"
   ```

1. Сгенерировать пару ключей SSH и скопировать открытый ключ в буфер обмена:

   ```bash
   $ ssh-keygen -t rsa -b 4096 -C "radimir.com@gmail.com"
   $ ssh-add
   $ xclip -sel clip < ~/.ssh/id_rsa.pub
   ```

1. Добавить открытый ключ в GitHub:

   На странице [Профиль → Settings → SSH and GPG keys → New SSH key](https://github.com/settings/ssh/new):
   * **Title**: `radimir-work`
   * **Key**: _вставить из буфера обмена_

1. Проверить SSH-доступ и добавить GitHub в доверенные хосты:

   ```bash
   $ ssh -T git@github.com
   ```

1. Запустить конфигурирование системы:

   ```bash
   $ cd ~
   $ git clone git@github.com:radimih/dotfiles.git
   $ ./dotfiles/install.sh
   ```
