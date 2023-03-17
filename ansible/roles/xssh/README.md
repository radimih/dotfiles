# Ansible-роль `xssh`

Установка Bash-скрипта [xssh](https://github.com/radimih/xssh) для организации SSH-соединений.

Для запуска скрипта из среды рабочего стола настраивается
[XDG Desktop Entry](https://wiki.archlinux.org/title/Desktop_entries_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)).

## Аргументы роли

### Обязательные

| Аргумент          | Описание
| ----------------- | --------
| `connections_dir` | Каталог, где хранятся файлы-профили соединений. Будет создан, если не существует.

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------

## Пример

```yaml
- role: xssh
  vars:
    connections_dir: '{{ ansible_user_dir }}/.ssh/connections'
```
