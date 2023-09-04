# Ansible-роль `kubectl`

Установка [kubectl](https://kubernetes.io/docs/reference/kubectl/) и менеджера плагинов [Krew](https://krew.sigs.k8s.io/) к нему.

По мотивам официальной [инструкции по установке](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/).

Роль создаёт ZSH-алиас `k` для команды `kubectl`.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------
| `krew_plugins` | [Список](https://krew.sigs.k8s.io/plugins/) krew-плагинов | `[]`
