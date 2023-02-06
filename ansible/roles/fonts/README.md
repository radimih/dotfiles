# Установка шрифтов

Шрифты берутся из каталога `files`:

- `NerdFonts/` - шрифты от проекта [Nerd Fonts](https://www.nerdfonts.com/):
  - [Iosevka](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip):
    только шрифты **`Term`** `Nerd Font Complete` **`Mono`** [ `ExtraLight` | `Light` | `Bold` ] [`Italic`]:

    ```bash
    ls *.ttf | grep -v -E "Iosevka Term Nerd Font Complete Mono( (Bold|ExtraLight|Light))?( Italic)?\." | xargs -d '\n' rm
    ```

## Аргументы Ansible-роли

### Обязательные

| Аргумент | Описание |
| --- | --- |  

### Необязательные

| Аргумент | Описание | Значение по-умолчанию |
| --- | --- | --- |
