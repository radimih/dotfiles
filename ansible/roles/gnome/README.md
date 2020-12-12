# GNOME

Настройка DE [GNOME Shell](https://wiki.gnome.org/Projects/GnomeShell) и его [расширений](https://extensions.gnome.org/).

## Переменные Ansible-роли

#### Обязательные

| Переменная | Описание |
| --- | --- |  

#### Необязательные

| Переменная | Описание | Значение по-умолчанию |
| --- | --- | --- |
| `gnome_extensions_ids` | Список **Id** устанавливаемых расширений (https://extensions.gnome.org/).<br><br>**Id** можно взять из URL расширения. Например, `3357` для расширения *Material Shell* (https://extensions.gnome.org/extension/3357/material-shell/) | `[]` |
