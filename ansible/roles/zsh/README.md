# Ansible-роль `zsh`

Установка оболочки [zsh](https://zsh.sourceforge.io/) и её плагинов.

Для управления плагинами используется менеджер плагинов [antidote](https://github.com/mattmc3/antidote).

[Startup-файлы](https://zsh.sourceforge.io/Doc/Release/Files.html) оболочки размещаются
в каталоге `~/.config/zsh`. Для этого определяется стандартная переменная окружения `ZDOTDIR`.

В подкаталоге `~/.config/zsh/zshrc.d` могут располагаться дополнительные zsh-скрипты инициализации, которые
будут выполняться в _алфавитном_ порядке в момент входа в _интерактивный режим_ оболочки.
Переменная окружения `ZSHRC_DIR` указывает на этот каталог. Другие роли могут устанавливать свои
zsh-скрипты инициализации, ссылаясь на эту переменную: `{{ ansible_env.ZSHRC_DIR }}`.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

<table>
<thead>
<th>
Аргумент
</th>
<th>
Описание
</th>
<th>
Значение по-умолчанию
</th>
</thead>
<tbody>

<tr>

<td valign="top">

`aliases`

</td>
<td valign="top">

Словарь _обычных_ [алиасов](https://zsh.sourceforge.io/Doc/Release/Shell-Grammar.html#Aliasing), когда
заменяется только _первое_ слово в команде:

- **ключ** - алиас (слово)
- **значение** - строка замены

</td>

<td valign="top">

`{}`

</td>

</tr>

<tr>

<td valign="top">

`aliases_global`

</td>
<td valign="top">

Словарь _глобальных_ [алиасов](https://zsh.sourceforge.io/Doc/Release/Shell-Grammar.html#Aliasing), когда
слово заменяется в _любом_ месте команды:

- **ключ** - алиас (слово)
- **значение** - строка замены

</td>

<td valign="top">

`{}`

</td>

</tr>

<tr>

<td valign="top">

`default_editor`

</td>
<td valign="top">

Текстовый редактор по-умолчанию (значение переменной окружения `EDITOR`)

</td>

<td valign="top">

`vi`

</td>

</tr>

<tr>

<td valign="top">

`plugins`

</td>
<td valign="top">

Список zsh-плагинов. Каждый плагин определятся словарём:

- `name:` имя плагина в виде `<repo>/<plugin>`
- `path:` _(необязательно)_ подкаталог или файл внутри репозитория плагина

ВНИМАНИЕ! Нет необходимости указывать в этом списке shell prompt-плагины.
Они устанавливаются автоматически в зависимости от значения аргумента
`prompt`.

</td>

<td valign="top">

`[]`

</td>

</tr>

<tr>

<td valign="top">

`prompt`

</td>
<td valign="top">

Shell prompt. Возможные значения:

- `default` — использовать стандартный shell prompt
- `p10k` — [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- `pure` — [Pure](https://github.com/sindresorhus/pure)

</td>

<td valign="top">

`default`

</td>

</tr>

<tr>

<td valign="top">

`zsh_home_subdir`

</td>
<td valign="top">

Подкаталог в домашнем каталоге пользователя для размещения всех конфигурационных и
[startup-файлов](https://zsh.sourceforge.io/Doc/Release/Files.html) оболочки.

</td>

<td valign="top">

`.config/zsh`

</td>

</tr>

</tbody>
</table>

## Пример

```yaml
- role: zsh
  vars:
    aliases:
      df: df -h
      du: du -h
      e: $EDITOR
      ping: ping -c4
    aliases_global:
      G: '| grep'
      H: '| head'
      T: '| tail'
    default_editor: vim
    plugins:
      - name: zsh-users/zsh-autosuggestions
      - name: marlonrichert/zsh-autocomplete
      - name: zdharma/fast-syntax-highlighting
      - name: belak/zsh-utils
        path: completion
    prompt: p10k
```

## Shell prompt [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

После существенного обновления этого prompt-плагина желательно заново формировать
его конфигурационный файл `.p10k.zsh`:

```bash
p10k configure
cp $ZDOTDIR/.p10k.zsh ~/dotfiles/ansible/roles/zsh/files/
```

Рекомендуемые параметры:

1. Does this look like a diamond? `(y) Yes`
1. Does this look like a lock? `(y) Yes`
1. Does this look like a Debian logo? `(y) Yes`
1. Do all these icons fit between the crosses? `(y) Yes`
1. Prompt Style: `(3) Rainbow`
1. Character Set: `(1) Unicode`
1. Show current time? `(1) No`
1. Prompt Separators: `(2) Vertical`
1. Prompt Heads: `(4) Round`
1. Prompt Tails: `(1) Flat`
1. Prompt Height: `(2) Two lines`
1. Prompt Connection: `(2) Dotted`
1. Prompt Frame: `(1) No frame`
1. Connection Color: `(4) Darkest`
1. Prompt Spacing: `(2) Sparse`
1. Icons: `(1) Few icons`
1. Prompt Flow: `(1) Concise`
1. Enable Transient Prompt? `(n) No`
1. Instant Prompt Mode: `(2) Quiet`
1. Apply changes to ~/.zshrc? `n) No`
