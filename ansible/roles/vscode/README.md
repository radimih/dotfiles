# Ansible-роль `vscode`

Установка [Visual Studio Code](https://code.visualstudio.com/).

По мотивам официальной [инструкции по установке](https://code.visualstudio.com/docs/setup/linux).

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------

## Настройка после установки

НИЧЕГО НЕ НАСТРАИВАТЬ, а просто включить синхронизацию:

"Шестерёнка" (Manage) → `Turn on Settings Sync...`:

1. Отключить `UI State`
1. Нажать **Sign in & Turn on**
1. Выбрать `Sign in with GitHub`

На всякий случай настройки из каталога `~/.config/Code/User` сохранены здесь:

- [`keybindings.json`](files/keybindings.json)
- [`settings.json`](files/settings.json)
