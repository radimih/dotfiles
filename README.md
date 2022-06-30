# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Ansible-роли

Роль | Назначение | Ручная донастройка? | Тэги
---- | ---------- | :-----------------: | ----
[dev-python](ansible/roles/dev-python) | Настройка окружения для разработки на Python | нет | `dev` `python`
[docker](ansible/roles/docker) | Установка [Docker](https://docs.docker.com/engine/) и [Docker Compose](https://docs.docker.com/compose/) | нет | `docker`
[fonts](ansible/roles/fonts) | Установка шрифтов | нет | `fonts`
[flameshot](ansible/roles/flameshot) | Установка утилиты [flameshot](https://github.com/flameshot-org/flameshot) для создания скриншотов | нет | `flameshot`
[gnome](ansible/roles/gnome) | Настройка DE [GNOME Shell](https://wiki.gnome.org/Projects/GnomeShell) и его расширений | нет | `gnome`
[joplin](ansible/roles/joplin) | Установка приложения [Joplin](https://joplinapp.org/) для ведения заметок | [да](ansible/roles/joplin#после-установки) | `joplin`
[keyboard](ansible/roles/keyколлекциboard) | Настройка клавиатуры (переопределение клавиш и переключение раскладок) | нет | `keyboard`
[ranger](ansible/roles/ranger) | Установка консольного файлового менеджера [ranger](https://github.com/ranger/ranger) | нет | `ranger`
[remmina](ansible/roles/remmina) | Установка приложения [Remmina](https://remmina.org/) для доступа к хостам через SSH и RDP | [да](ansible/roles/remmina#после-установки) | `remmina`
[vim](ansible/roles/vim) | Установка и настройка VIM | нет | `vim`
[zsh](ansible/roles/zsh) | Установка shell-оболочки [Zsh](https://www.zsh.org/) и настройка окружения | нет | `zsh`

## Первоначальная установка на новую систему

#### Привязка к GitHub-аккаунту

1. Установить минимальный набор пакетов:

   ```bash
   sudo apt update && sudo apt install -y git xsel
   ```

1. Сгенерировать пару ключей SSH и скопировать открытый ключ в буфер обмена:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "radimir.com@gmail.com" && \
   ssh-add  && \
   xsel --input --clipboard < ~/.ssh/id_rsa.pub
   ```

1. Добавить открытый ключ в GitHub-аккаунт:

   На странице [Профиль → Settings → SSH and GPG keys → New SSH key](https://github.com/settings/ssh/new):
   * **Title**: `radimir-work`
   * **Key**: _вставить из буфера обмена_

1. Проверить SSH-доступ и добавить хост GitHub в доверенные хосты:

   ```bash
   ssh -T git@github.com
   ```

#### Клонирование и настройка GitHub-репозитория

1. Склонировать репозиторий:

   ```bash
   cd ~ && git clone git@github.com:radimih/dotfiles.git && cd dotfiles
   ```

1. Настроить идентификацию пользователя в репозитории (для внесения изменений в будущем):

   ```bash
   git config user.email "radimir.com@gmail.com" && \
   git config user.name "Radimir Mikhailov"
   ```
   
   Желательно не устанавливать глобальную идентификацию в git (ключ `--global`), чтобы
   случайно не смешать рабочие и личные идентификации в git.

#### Настройка [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)

1. Задать пароль, с которым были зашифрованы все секреты:

   ```bash
   vi ansible/.vault-pass && chmod 600 ansible/.vault-pass
   ```

   Файл `ansible/.vault-pass` не должен храниться в системе контроля версий.

   Имя этого файла определено в параметре `vault_password_file` в файле `ansible/ansible.cfg`.

#### Установка Ansible

1.
   ```bash
   ./install-ansible.sh
   ```

   Устанавливается официальный **Ansible community package**, который включает в себя
   **ansible-core** и стандартный набор [коллекций](https://docs.ansible.com/ansible/latest/collections/index.html).

   Можно было бы установить только пакет `ansible-core` и далее с помощью команды `ansible-galaxy collection install`
   установить только необходимые коллекции, но в этом случае пришлось бы обновлять эти коллекции вручную
   (ключ `--upgrade` у вышеприведённой команды).

## Установка / обновление компонент

```bash
cd ~/dotfiles/ansible
ansible-playbook playbook.yml --limit "desktop|{имена серверов через запятую}" --tags "{список тэгов через запятую}"
```

Для серверов можно игнорировать запрос пароля `BECOME password:` и просто нажимать Enter.
