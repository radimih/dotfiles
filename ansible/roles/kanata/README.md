# Ansible-роль `kanata`

Переопределение поведения некоторых клавиш с помощью [kanata](https://github.com/jtroo/kanata):

| Клавиша       | Однократное нажатие         | На удержании
|:-------------:|:---------------------------:|:------------:
| `CapsLock`    | `ESC`                       | `Left Ctrl`
| `Left Shift`  | `Ctrl + Shift + Meta + F11` | `Left Shift`
| `Right Shift` | `Ctrl + Shift + Meta + F12` | `Right Shift`

Плюс, реализован режим [Home Row Mods](https://precondition.github.io/home-row-mods).

Чтобы принудительно завершить сервис `kanata` необходимо нажать комбинацию `Left Ctrl + Space + ESC`.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------
