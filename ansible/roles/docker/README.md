# Docker

Ansible-роль для установки [Docker](https://docs.docker.com/engine/install/).

[Docker Compose](https://docs.docker.com/compose/) устанавливается как плагин к Docker (`docker compose --version`).

## Переменные Ansible-роли

#### Обязательные

| Переменная | Описание |
| --- | --- |  

#### Необязательные

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
</thead>
<tbody>

<tr>

<td valign="top">

`daemon_json_default`

</td>
<td valign="top">

Параметры [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/) по-умолчанию,
которые хранятся в json-файле `/etc/docker/daemon.json`.

Содержимое json-файла `/etc/docker/daemon.json` по-умолчанию, в котором задаются параметры
[dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/).

Внимание! Приведено для справки. Чтобы изменить какие-либо значения параметров
по-умолчанию или задать дополнительные параметры, необходимо использовать переменную `daemon_json_extra`.
</td>

<td valign="top">

```yaml
features:
  buildkit: true
log-driver: local
log-opts:
  max-size: 10m
  max-file: '3'  # must always be a string
bip: 100.64.0.1/24
fixed-cidr: 100.64.0.1/24
default-address-pools:
  - base: 100.65.0.0/16
    size: 25
```

</td>

</tr>

<tr>

<td valign="top">

`daemon_json_extra`

</td>
<td valign="top">

Параметры [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/),
которые будут перекрывать или дополнять параметры из `daemon_json_default`.

</td>

<td valign="top">

`{}`

</td>

</tr>

</tbody>
</table>

## Пример

```yaml
- role: docker
  vars:
    daemon_json_extra:
      log-driver: json-file
      log-opts:
        max-size: 100m
        max-file: '5'  # must always be a string
        tag: '{% raw %}{{.ImageName}}|{{.Name}}{% endraw %}'
      experimental: true
      metrics-addr: "0.0.0.0:9323"
      insecure-registries:
        - 172.17.21.6:4444
        - 172.17.21.6:2222
      registry-mirrors:
        - http://172.17.21.6:4444
```

## Ссылки

* [dockerd options](https://docs.docker.com/engine/reference/commandline/dockerd/)
* [Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/)
* [Customize log driver output](https://docs.docker.com/config/containers/logging/log_tags/) (`log-opts.tag` options)
