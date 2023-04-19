# Обновление прошивок оборудования

Обновление производится с помощью фреймворка [fwupd](https://github.com/fwupd/fwupd)
и соответствующего [Linux Vendor Firmware Service (LVFS)](https://fwupd.org/).

Посмотреть оборудование, обнаруживаемое fwupd:

```bash
fwupdmgr get-devices
```

## Обновление прошивок

Обновить прошивки можно с помощью **GNOME Software** или утилитой `fwupdmgr`:

1. Получить последние метаданные из [LVFS](https://fwupd.org/):

    ```bash
    fwupdmgr refresh –force
    ```

1. Посмотреть какие обновления доступны для текущего оборудования:

    ```bash
    fwupdmgr get-updates
    ```

1. Закачать и обновить прошивки:

    ```bash
    sudo fwupdmgr update
    ```
