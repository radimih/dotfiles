# Установка [Fedora Workstation](https://fedoraproject.org/workstation/)

## Ключевые особенности установки

- **Language**: `English`  
  Так проще эксплуатировать систему. Русская раскладка добавляется позже в плейбуках.
- **File system**: `ext4`  
  Чем проще, тем лучще. На десктопе практически не используются фишки Btrfs.
- **Disk encryption**: `ON`

## Параметры установки

- Language: `English` (default)
- Time & Date: `Asia` / `Novokuznetsk`
- Installation Destination:
    1. Выбрать Storage Configuration: `Custom`
    1. Удалить все существующие разделы
    1. New mount points will use the following partitioning scheme: `Standard Partition`
    1. Encrypt my data: `ON`
    1. Click here to create them automatically

    | Mount Point | Size      | Device Type        | Encrypt | LUKS Version | File System
    | ----------- | --------: | :----------------: | :-----: | :----------: | :------------------:
    | `/boot/efi` |   600 Mib | Standard Partition | —       | —            | EFI System Partition
    | `/boot`     |  1024 Mib | Standard Partition | —       | —            | ext4
    | `/`         | остальное | Standard Partition | ON      | luks2        | **ext4**

## Сразу после установки

### В мастере настройки

- Automatic Problem Reporting: `OFF`
- Enable Third-party Repositories: `DISABLE`
- Full Name: `Radimir`
- Username: `radimir`

### В Settings (только для ноутбука)

Mouse & Touchpad
- Touchpad Speed: увеличить
- Tap to Click: `ON`

### В терминале

1. Назначить имя хосту в формате `my`|_компания_`-`_компьютер_|`office`:
    ```bash
    sudo hostnamectl set-name it2g-dell5490
    ```
1. Обновить систему:
    ```bash
    sudo dnf -y –-refresh update
    sudo reboot
    ```
