# LayoutSwitcher GNOME extension 

До GNOME 41 раскладку клавиатуры можно было переключать программно командой:

```bash
gdbus call 
  --session 
  --dest org.gnome.Shell \
  --object-path /org/gnome/Shell \
  --method org.gnome.Shell.Eval \
  "imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()"
```

Начиная с версии GNOME 41 метод `org.gnome.Shell.Eval` был отключен по причинам безопасности.

Чтобы по-прежнему иметь возможность переключать раскладку клавиатуры с помощью `gdbus`,
устанавливается самописное GNOME-расширение `LayoutSwitcher`, с помощью которого раскладки
переключаются командой:

```bash
gdbus call \
  --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/Shell/LayoutSwitcher \
  --method org.gnome.Shell.LayoutSwitcher.Switch <буквенный идентификатор раскладки>
```

Идентификаторы установленных раскладок клавиатуры можно посмотреть командой:

```bash
gsettings get org.gnome.desktop.input-sources sources
```

## Переменные Ansible-роли

#### Обязательные

| Переменная | Описание |
| --- | --- |  

#### Необязательные

| Переменная | Описание | Значение по-умолчанию |
| --- | --- | --- |
