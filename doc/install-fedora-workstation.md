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

1. Обновить систему:

    ```bash
    sudo dnf offline-upgrade download -y --refresh
    sudo dnf offline-upgrade reboot
    ```

## Регистрация (enroll) ключа в прошивке UEFI

Чтобы можно было устанавливать дополнительные модули ядра в режиме загрузки **Secure Boot**
(проприетарные драйверы NVidia, VirtualBox etc), необходимо добавить публичный ключ
созданного удостоверяющего центра (CA) в список разрешённых для использования в UEFI
Secure Boot материнской платы компьютера.

1. Проверить, включен ли режим загрузки **Secure Boot**:

    ```bash
    mokutil --sb-state
    ```

1. Установить необходимые пакеты:

    ```bash
    sudo dnf install -y kmodtool akmods openssl
    ```

1. Сгенерировать CA со значениями по-умолчанию:

    ```bash
    sudo kmodgenca -a
    ```

   В каталоге `/etc/pki/akmods` будет создана ключевая пара:

     - `certs/public_key.der` - сертификат публичного ключа
     - `private/private_key.priv` - приватный ключ

1. Инициировать регистрацию (enrollment) публичного ключа в прошивке UEFI в качестве
   [MOK](https://wiki.debian.org/SecureBoot#MOK_-_Machine_Owner_Key) (Machine Owner Key):

    ```bash
    sudo mokutil --import /etc/pki/akmods/certs/public_key.der
    ```

    Будет предложено назначить пароль, который нужно будет ввести _один раз_ перед его регистрацией в UEFI.

    Посмотреть сертификат публичного ключа, который будет встроен в UEFI:

    ```bash
    sudo mokutil --list-new
    ```

1. Перезагрузить компьютер:

    ```bash
    sudo reboot
    ```

1. Зарегистрировать (enroll) ключ в прошивке:

   Сразу после перезапуска появится диалог менеджера MOK, который сообщит об обнаружении нового сертификата
   и предложит произвести настройку. Шаги:

    1. `Enroll MOK`
    1. `Continue`
    1. `Yes`
    1. Ввести пароль
    1. `Reboot`

1. Посмотреть сертификаты публичных ключей, установленных в прошивке UEFI:

    ```bash
    mokutil --list-enrolled
    ```

### Ссылки

- [RPMFusion Secure Boot How-to](https://rpmfusion.org/Howto/Secure%20Boot)
- [Настраиваем поддержку UEFI Secure Boot для драйверов NVIDIA](https://www.easycoding.org/2022/05/31/nastraivaem-podderzhku-uefi-secure-boot-dlya-drajverov-nvidia.html)
- `/usr/share/doc/akmods/README.secureboot`
