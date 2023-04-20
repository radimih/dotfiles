# Установка Fedora

Актуально для Fedora **38**.

| Mount Point | Size      | Device Type        | Encrypt | LUKS Version | File System
| ----------- | --------: | :----------------: | :-----: | :----------: | :------------------:
| `/boot/efi` |   600 Mib | Standard Partition | —       | —            | EFI System Partition
| `/boot`     |  1024 Mib | Standard Partition | —       | —            | ext4
| `/`         | остальное | Standard Partition | ON      | luks2        | **ext4**

# ВРЕМЕННО

## Установка Fedora 38

1. English (default)
1. Time & Date: Asia / Novokuznetsk
1. Installation Destination
    - Storage Configuration: Custom
    - Удалить все существующие разделы
    - New mount points will use the following partitioning scheme: Standard Partition
    - Encrypt my data ON
    - Click her to create them automatically

## Сразу после установки

### в мастере настройки

- Automatic Problem Reporting: OFF
- Enable Third-party Repositories: DISABLE
- Full Name: Radimir
- Username: radimir

### в Settings

Mouse & Touchpad
Touchpad Speed: увеличить
Tap to Click: ON

### в Terminal

$ sudo hostnamectl set-name it2g-dell5490
$ sudo dnf -y –refresh update
$ sudo reboot
