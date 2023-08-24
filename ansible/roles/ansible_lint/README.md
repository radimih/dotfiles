# Ansible-роль `ansible_lint`

Роль для установки [ansible-lint](https://github.com/ansible/ansible-lint).

**ansible-lint** использует внутри себя [yamllint](https://github.com/adrienverge/yamllint),
подставляя ему свою конфигурацию, если не находит другую. Но ищет он её только в текущем
каталоге и в файле `~/.config/yamllint/config`. Соответственно, **ansible-lint** не будет
видеть [конфигурацию **yamllint**](https://yamllint.readthedocs.io/en/stable/configuration.html)
в домашнем каталоге.

Поэтому, ВНИМАНИЕ, общая конфигурация **ansible-lint** и **yamllint** в части проверки YAML должна
размещаться в файле `~/.config/yamllint/config`.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------
