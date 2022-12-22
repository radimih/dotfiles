# gnome_custom_keybindings

Определение кастомных клавиатурных привязок в среде GNOME.

ВНИМАНИЕ! В GNOME остаются активными только перечисленные в аргументах роли кастомные привязки.
Привязки, определённые вне этой роли (например, через _Settings_), после выполнения роли становятся
неактивными.

Посмотреть текущие привязки:

```bash
dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/
```

Посмотреть какие из них включены:

```bash
dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
```

## Аргументы Ansible-роли

### Обязательные

<table>
<thead>
<th>
Аргумент
</th>
<th>
Описание
</th>
</thead>
<tbody>

<tr>

<td valign="top">

`key_bindings`

</td>
<td valign="top">

Список клавиатурных привязок. Каждая привязка определятся словарём:

* `name:` название привязки
* `binding:` комбинация клавиш в виде строки (например, `<Ctrl><Alt>F12`)
* `command:` Shell-команда

</td>

</tr>

</tbody>
</table>

### Необязательные

| Аргумент | Описание | Значение по-умолчанию |
| --- | --- | --- |
