# Ansible-роль `yamllint`

Роль для установки [yamllint](https://github.com/adrienverge/yamllint).

ВНИМАНИЕ! Так как [ansible-lint](https://github.com/ansible/ansible-lint) использует внутри себя
**yamllint**, предоставляя ему конфигурацию из файла `~/.config/yamllint/config`, роль размещает
[конфигурацию **yamllint**](https://yamllint.readthedocs.io/en/stable/configuration.html) в этом
файле.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------
