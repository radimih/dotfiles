# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Состав

#### Ansible-роли

Роль | Назначение | Ручная донастройка? | Тэги
---- | ---------- | :-----------------: | ----
[dev-python](ansible/roles/dev-python) | Настройка окружения для разработки на Python | нет | `dev` `python`
[docker](ansible/roles/docker) | Установка [Docker](https://docs.docker.com/engine/) и [Docker Compose](https://docs.docker.com/compose/) | нет | `docker`
[fonts](ansible/roles/fonts) | Установка шрифтов | нет | `fonts`
[gnome](ansible/roles/gnome) | Настройка DE [GNOME Shell](https://wiki.gnome.org/Projects/GnomeShell) и его расширений | нет | `gnome`
[joplin](ansible/roles/joplin) | Установка приложения [Joplin](https://joplinapp.org/) для ведения заметок | [да](ansible/roles/joplin#после-установки) | `joplin`
[keyboard](ansible/roles/keyboard) | Настройка клавиатуры (переопределение клавиш и переключение раскладок) | нет | `keyboard`
[minipack](ansible/roles/minipack) | Установка минимального набор пакетов | нет | `minipack`
[pipx](ansible/roles/pipx) | Установка утилиты [pipx](https://joplinapp.org/) для управления Python-приложениями | нет | `pipx`
[remmina](ansible/roles/remmina) | Установка приложения [Remmina](https://remmina.org/) для доступа к хостам через SSH и RDP | [да](ansible/roles/remmina#после-установки) | `remmina`
[vim](ansible/roles/vim) | Установка и настройка VIM | нет | `vim`
[zsh](ansible/roles/zsh) | Установка shell-оболочки [Zsh](https://www.zsh.org/) и настройка окружения | нет | `zsh`

## Установка / актуализация конфигурации системы

ВНИМАНИЕ! Перед первой установкой необходимо задать пароль для [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
(см. [Настройка Ansible Vault](#настройка-ansible-vault)).

Предполагается, что пароль хранится в файле `ansible/.vault-pass` и этот файл никаким образом не должен храниться в системе контроля версий!

Имя этого файла определено в параметре `vault_password_file` в файле `ansible/ansible.cfg`.

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
   $ sudo apt install -y xsel git
   ```

1. Сгенерировать пару ключей SSH и скопировать открытый ключ в буфер обмена:

   ```bash
   $ ssh-keygen -t rsa -b 4096 -C "radimir.com@gmail.com"
   $ ssh-add
   $ xsel --input --clipboard < ~/.ssh/id_rsa.pub
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

#### Настройка Ansible Vault

1. Задать пароль, с которым были зашифрованы все секреты:

   ```bash
   $ vim ansible/.vault-pass && chmod 600 ansible/.vault-pass
   ```
