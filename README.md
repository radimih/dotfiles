# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Первоначальная установка на новую систему

### 1. Привязка к GitHub-аккаунту

1. Установить минимальный набор пакетов:

   ```bash
   sudo apt update && sudo apt install -y git xsel
   ```

1. Сгенерировать пару ключей SSH и скопировать открытый ключ в буфер обмена:

   ```bash
   ssh-keygen -t ed25519 && \
   ssh-add  && \
   xsel --input --clipboard < ~/.ssh/id_ed25519.pub
   ```

1. Добавить открытый ключ в GitHub-аккаунт:

   На странице [Профиль → Settings → SSH and GPG keys → New SSH key](https://github.com/settings/ssh/new):
   - **Title**: `<пользователь>-< 'my' | компания>-<компьютер | 'office'>`
   - **Key**: _вставить из буфера обмена_

1. Проверить SSH-доступ и добавить хост GitHub в доверенные хосты:

   ```bash
   ssh -T git@github.com
   ```

### 2. Клонирование и настройка GitHub-репозитория

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

### 3. Установка Ansible

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
ansible-playbook <плейбук.yml> --tags "<список тэгов через запятую>"
```
