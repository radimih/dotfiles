# Flameshot

Установка утилиты [Flameshot](https://github.com/flameshot-org/flameshot) для создания скриншотов экрана.

## Аргументы Ansible-роли

#### Обязательные

| Аргумент | Описание |
| --- | --- |  

#### Необязательные

| Аргумент | Описание | Значение по-умолчанию |
| --- | --- | --- |
| `options` | Словарь параметров Flameshot из секции `[General]`, значения которых подменяются в конфигурационном файле приложения (`~/snap/flameshot/current/.config/flameshot/flameshot.ini`).<br/><br/>ВНИМАНИЕ! Boolean-значения параметров должны задаваться только в виде строк `'true'` или `'false'`. | `{}` |

## Пример

```yaml
- role: flameshot
    vars:
      options:
        # Отключить ненужные кнопки
        buttons: !unsafe '@Variant(\0\0\0\x7f\0\0\0\vQList<int>\0\0\0\0\x11\0\0\0\0\0\0\0\x1\0\0\0\x2\0\0\0\x3\0\0\0\x4\0\0\0\x5\0\0\0\x6\0\0\0\x12\0\0\0\xf\0\0\0\x13\0\0\0\t\0\0\0\x10\0\0\0\n\0\0\0\v\0\0\0\f\0\0\0\x14\0\0\0\x15)'
        drawColor: '#ff0000'
        drawFontSize: '10'
        drawThickness: '5'
        showDesktopNotification: 'false'
        showHelp: 'false'
        showStartupLaunchMessage: 'false'
        uiColor: '#90c9e5'
```

## Настройка под GNOME

```yaml
- name: Освободить клавишу Print для приложения Flameshot
  community.general.dconf:
    key: /org/gnome/shell/keybindings/show-screenshot-ui
    value: "['']"
    state: present
```

```yaml
- name: Определить кастомные клавиатурные привязки (все предыдущие удаляются)
  role: gnome_custom_keybindings
  vars:
    key_bindings:
      - name: Screenshot by Flameshot
        binding: 'Print'
        command: flameshot gui
      - ...
```

ВНИМАНИЕ! GNOME под Wayland не даёт прямого доступа к снятию скриншотов сторонним приложениям.
Каждый раз необходимо нажимать кнопку `Share` во всплывающем диалоге. Причём после нажатия
этой кнопки Flameshot получает в своё распоряжение "увеличенный" экран, если в настройках GNOME 
включен scale экрана. Соответственно, в этом случае невозможно сделать полноценный скриншот.
