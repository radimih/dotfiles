# Установка [Fedora Workstation](https://fedoraproject.org/workstation/)

## Ключевые особенности установки

- **Language**: `English`  
  Так проще эксплуатировать систему. Русская раскладка добавляется позже в плейбуках.
- **File system**: `ext4`  
  Чем проще, тем лучще. На десктопе практически не используются фишки Btrfs.
- **Disk encryption**: `ON`

## Мастер установки

### 1. WELCOME TO FEDORA

- What language ...? `English (United States)` (_default_)

### 2. INSTALLATION SUMMARY

- Keyboard: `English (US)` (_default_)
- Time & Date: `Asia` / `Novokuznetsk`

### 3. INSTALLATION DESTINATION

1. Device Selection: _выбрать SSD-диск_
1. Storage Configuration: `Custom`

### 4. MANUAL PARTITIONING

1. Удалить все существующие разделы

#### Ручная разметка диска

| Mount Point | Size            | Device Type        | Encrypt | LUKS Version | File System
| ----------- | --------------: | :----------------: | :-----: | :----------: | :------------------:
| `/boot/efi` |  `600` Mib      | Standard Partition | —       | —            | EFI System Partition
| `/boot`     | `1024` Mib      | Standard Partition | —       | —            | ext4
| `/`         |  _не указывать_ | Standard Partition | ON      | luks2        | **ext4**

Чтобы появилась возможность включить шифрование раздела необходимо в какой-то момент
кликнуть на список разделов, чтобы он обновился (исчезла запись с btrfs).

#### Автоматическая разметка диска

1. New mount points will use the following partitioning scheme: `Standard Partition`
1. Encrypt my data: `ON`
1. Нажать **Click here to create them automatically**

В том числе будут созданы два пользовательских раздела (оба шифруются):

- `/` - примерно на 70 Гб
- `/home` - на остальной объём диска

## Сразу после установки

### В мастере настройки

- Automatic Problem Reporting: `OFF`
- Third-Party Repositories: _не включать_
- Full Name: `Radimir`
- Username: `radimir`

### В Settings (только для ноутбука)

- Mouse & Touchpad / Touchpad:
  - Touchpad Speed: _увеличить_
  - Tap to Click: `ON`

### В терминале

1. Назначить имя хосту в формате `my`|_компания_`-`_компьютер_|`office`:

    ```bash
    sudo hostnamectl hostname it2g-dell5490
    ```

1. Обновить систему:

    ```bash
    sudo dnf offline-upgrade download -y --refresh
    sudo dnf offline-upgrade reboot
    ```

### В Firefox

1. <https://google.com/chrome>
1. Нажать **Download Chrome**
1. Выбрать **64bit .rpm**
1. Нажать **Accept and Install**
1. ВНИМАНИЕ! Не выбирать установку Third-Party Repositories в **Software**
