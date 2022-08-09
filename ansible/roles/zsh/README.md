# Zsh и плагины

Используется очень быстрый менеджер плагинов [Zinit](https://github.com/zdharma/zinit).

Конфигурирование плагинов сделано по мотивам Ansible-роли [ansible-zplugin](https://github.com/Townk/ansible-zplugin).

В качестве shell prompt используется [Powerklevel10k](https://github.com/romkatv/powerlevel10k). Устанавливается как Zinit-плагин.

## Переменные Ansible-роли

#### Обязательные

| Переменная | Описание |
| --- | --- |  

#### Необязательные

| Переменная | Описание | Значение по-умолчанию |
| --- | --- | --- |
<table>
<thead>
<th>
Переменная
</th>
<th>
Описание
</th>
<th>
Значение по-умолчанию
</th>
<tr>
</thead>
<tbody>
<td valign="top">

`zinit_plugins` 

</td>
<td valign="top">

Список zsh-плагинов. Каждый плагин определятся словарём:

* `name:` имя плагина в виде `<repo>/<plugin>`
* `type:` тип загрузки плагина:
  * `light`
  * `load`
* `ices:` необязательный список опций плагина. Каждая опция определяется словарём:
  * `name:` имя опции
  * `value:` значение опции

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
    zinit_plugins:
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
