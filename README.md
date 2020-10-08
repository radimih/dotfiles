# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Состав

#### Ansible-роли

Роль | Назначение | Ручная донастройка? | Тэги
---- | ---------- | :-----------------: | ----
[fonts](ansible/roles/fonts) | Установка шрифтов | нет | `fonts`
[joplin](ansible/roles/joplin) | Установка приложения [Joplin](https://joplinapp.org/) для ведения заметок | [да](ansible/roles/joplin#после-установки) | `joplin`
[minipack](ansible/roles/minipack) | Установка минимального набор пакетов | нет | `minipack`
[pipx](ansible/roles/pipx) | Установка утилиты [pipx](https://joplinapp.org/) для управления Python-приложениями | нет | `pipx`
[remmina](ansible/roles/remmina) | Установка приложения [Remmina](https://remmina.org/) для доступа к хостам через SSH и RDP | [да](ansible/roles/remmina#после-установки) | `remmina`
[zsh](ansible/roles/zsh) | Установка shell-оболочки [Zsh](https://www.zsh.org/) и настройка окружения | нет | `zsh`

## Установка / актуализация конфигурации системы

#### Полная установка / обновление

```bash
$ ~/dotfiles/update.sh
```

#### Частичное обновление

```bash
$ cd ~/dotfiles/ansible
$ ansible-playbook playbook.yml --ask-become-pass --tags "{список тэгов через запятую}"
```

## Первоначальная установка на новую систему

#### Привязка к GitHub-аккаунту

1. Установить минимальный набор пакетов:

   ```bash
   $ sudo apt install -y xclip git
   ```

1. Сгенерировать пару ключей SSH и скопировать открытый ключ в буфер обмена:

   ```bash
   $ ssh-keygen -t rsa -b 4096 -C "radimir.com@gmail.com"
   $ ssh-add
   $ xclip -sel clip < ~/.ssh/id_rsa.pub
   ```

1. Добавить открытый ключ в GitHub-аккаунт:

   На странице [Профиль → Settings → SSH and GPG keys → New SSH key](https://github.com/settings/ssh/new):
   * **Title**: `radimir-work`
   * **Key**: _вставить из буфера обмена_

1. Проверить SSH-доступ и добавить хост GitHub в доверенные хосты:

   ```bash
   $ ssh -T git@github.com
   ```

#### Клонирование и настройка GitHub-репозитория

1. Склонировать репозиторий:

   ```bash
   $ cd ~
   $ git clone git@github.com:radimih/dotfiles.git
   $ cd dotfiles
   ```

1. Настроить идентификацию пользователя в репозитории (для внесения изменений в будущем):

   ```bash
   $ git config user.email "radimir.com@gmail.com"
   $ git config user.name "Radimir Mikhailov"
   ```
   
   Желательно не устанавливать глобальную идентификацию  в git (ключ `--global`), чтобы
   случайно не смешать рабочие и личные идентификации в git.
