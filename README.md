# Radimir's dotfiles

Конфигурация моих локальных Linux-систем.

## Установка Linux

- [Fedora Workstation](doc/install-fedora-workstation.md)

## Первоначальная настройка системы

1. Назначить имя хосту в формате `my`|_компания_`-`_компьютер_|`office`:

    ```bash
    sudo hostnamectl hostname it2g-dell5490
    ```

1. Установить **Google Chrome**:
    1. <https://google.com/chrome>
    1. Нажать **Download Chrome**
    1. Выбрать **DEB** или **RPM**
    1. Нажать **Accept and Install**
    1. Нажать **Ignore** в всплывающем окне "Enable Third Party Software Repositories?"  
       (этот вопрос может задать приложение GNOME Software под Fedora)

1. Настроить синхронизацию в **Google Chrome**:
    1. Добавить нового пользователя
    1. Удалить `Person 1`

3. [Настроить dotfiles](doc/dotfiles.md)

## Конфигурирование

### Установка / обновление компонент

```bash
cd ~/dotfiles/ansible
ansible-playbook <плейбук.yml> --tags "<список тэгов через запятую>"
```

| Плейбук                                            | Описание
| -------------------------------------------------- | --------
| [`apps.yml`](ansible/apps.yml)                     | Установка приложений. Некоторые приложения требуют ручной донастройки, см. ниже.
| [`dev-devops.yml`](ansible/dev-devops.yml)         | Установка DevOps-инструментов
| [`general.yml`](ansible/general.yml)               | Общая настройка системы. Крайне желательно выполнять первым.
| [`gnome.yml`](ansible/gnome.yml)                   | Настройка GNOME. Чтобы новые расширения появились в приложении `Extensions`, требуется заново зайти в GNOME.
| [`virtualization.yml`](ansible/virtualization.yml) | Установка инструментов виртуализации

### Ручная донастройка приложений _(после выполнения плейбука `apps.yml`)_

- [Telegram](ansible/roles/telegram/README.md#настройка-после-установки)
- [VS Code](ansible/roles/vscode/README.md#настройка-после-установки)
- [Yandex Disk CLI](ansible/roles/yandex_disk_cli/README.md#настройка-после-установки)

### Прочее

- [Настройка WireGuard-соединений](doc/wireguard.md)
- [Обновление прошивок оборудования](doc/hardware.md)
