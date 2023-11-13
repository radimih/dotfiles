# Ansible-роль `kubectl`

Установка [kubectl](https://kubernetes.io/docs/reference/kubectl/) и менеджера плагинов [Krew](https://krew.sigs.k8s.io/) к нему.

По мотивам официальной [инструкции по установке](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/).

Роль настраивает автодополнение для оболочек Zsh и Fish.

## Аргументы роли

### Обязательные

| Аргумент | Описание
| -------- | --------
| `version` |

### Необязательные

| Аргумент | Описание | Default
| -------- | -------- | -------
| `krew_plugins` | Список [krew-плагинов](https://krew.sigs.k8s.io/plugins/) для установки/обновления. Установленные плагины, не входящие в этот список, **будут удалены** | `[]`
