# LayoutSwitchAPI GNOME extension 

Расширение используется для реализации немодального переключения раскладок клавиатуры в GNOME Shell.

До GNOME 41 раскладку клавиатуры можно было переключать программно командой:

```bash
gdbus call \
  --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/Shell \
  --method org.gnome.Shell.Eval \
  "imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()"
```

Начиная с версии GNOME 41 метод `org.gnome.Shell.Eval` был отключен по причинам безопасности.

Чтобы по-прежнему иметь возможность переключать раскладку клавиатуры с помощью `gdbus`,
устанавливается самописное GNOME-расширение `LayoutSwitchAPI`, с помощью которого раскладки
можно переключать командой:

```bash
gdbus call \
  --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/Shell/LayoutSwitchAPI \
  --method org.gnome.Shell.LayoutSwitchAPI.Switch <буквенный идентификатор раскладки (например, us)>
```

Идентификаторы установленных раскладок клавиатуры можно получить командой:

```bash
gsettings get org.gnome.desktop.input-sources sources
```

## Установка

ВНИМАНИЕ! В GNOME Shell расширение появится только после перезапуска GNOME Shell. Необходимо
выйти (`Log Out`) и зайти в GNOME Shell заново. После этого включить расширение **LayoutSwitchAPI**
в GUI-приложении `Extensions` или выполнить команду:

```bash
gnome-extensions enable layout-switch-api@radimir
```

## Переменные Ansible-роли

#### Обязательные

| Переменная | Описание |
| --- | --- |  

#### Необязательные

| Переменная | Описание | Значение по-умолчанию |
| --- | --- | --- |
