# Ansible-роль `zsh`

Установка shell-оболочки zsh и её плагинов.

Используется очень быстрый менеджер плагинов [zi](https://github.com/z-shell/zi) (бывший [Zinit](https://github.com/zdharma/zinit)).

Конфигурирование плагинов сделано по мотивам Ansible-роли [ansible-zplugin](https://github.com/Townk/ansible-zplugin).

В качестве shell prompt используется [Powerlevel10k](https://github.com/romkatv/powerlevel10k). Устанавливается как zi-плагин.
Иногда после крупного обновления необходимо заново формировать конфигурационный файл:

```bash
p10k configure
cp ~/.p10k.zsh ~/dotfiles/ansible/roles/zsh/files/
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

`plugins`

</td>
<td valign="top">

Список zsh-плагинов. Каждый плагин определятся словарём:

- `name:` имя плагина в виде `<repo>/<plugin>`
- `type:` тип загрузки плагина:
  - `light`
  - `load`
- `ices:` необязательный список опций плагина. Каждая опция определяется словарём:
  - `name:` имя опции
  - `value:` значение опции

</td>

<td valign="top">

`[]`

</td>

</tr>

</tbody>
</table>

## Пример

```yaml
- role: zsh
  vars:
    plugins:
      - name: zsh-users/zsh-autosuggestions
        type: light
      - name: marlonrichert/zsh-autocomplete
        type: light
      - name: zdharma/fast-syntax-highlighting
        type: light
      - name: romkatv/powerlevel10k
        type: light
        ices:
          - name: depth
            value: "1"
```
