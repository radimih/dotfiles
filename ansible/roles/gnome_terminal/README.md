# GNOME Terminal

Настройка GNOME Terminal.

Алгоритм настройки:

1. Настроить необходимые параметры в самом приложении.
1. Посмотреть изменённые параметры:

   ```bash
   dconf dump /org/gnome/terminal/legacy/
   ```

   ```ini
   [keybindings]                       # <--- аргумент keybindings
   copy='<Primary>c'
   paste='<Primary>v'

   [profiles:/:b1dcc9dd-...]           # <--- аргумент options
   background-color='rgb(0,43,54)'
   background-transparency-percent=9
   font='Iosevka Term Light 12'
   foreground-color='rgb(131,148,150)'
   use-system-font=false
   use-theme-colors=false
   use-theme-transparency=false
   use-transparent-background=true
   ```

## Аргументы Ansible-роли

### Обязательные

| Аргумент | Описание |
| --- | --- |  

### Необязательные

| Аргумент | Описание | Значение по-умолчанию |
| --- | --- | --- |
| `keybindings` | Словарь клавиатурных привязок GNOME Terminal | `{}` |
| `options` | Словарь параметров GNOME Terminal | `{}` |

## Пример

```yaml
- role: gnome_terminal
  vars:
    keybindings:
      copy: <Primary>c
      paste: <Primary>v
    options:
      background-color: rgb(0,43,54)      # Solarized dark
      foreground-color: rgb(131,148,150)  # Solarized dark
      background-transparency-percent: 9
      font: Iosevka Term Light 12
      use-system-font: false
      use-theme-colors: false
      use-theme-transparency: false
      use-transparent-background: true
```
