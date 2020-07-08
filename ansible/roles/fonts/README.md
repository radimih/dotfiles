# Установка шрифтов

Шрифты берутся из каталога `files`:

* `NerdFonts/` - шрифты из проекта [Nerd Fonts](https://www.nerdfonts.com/)
  * [Iosevka](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip):
    оставить только **Term** [ Extralight | Ligth | Bold ] **Mono** шрифты:
    ```bash
    ls *.ttf | grep -v -E "Iosevka Term( (Bold|Extralight|Light))? Nerd Font Complete Mono.ttf" | xargs -d '\n' rm
    ```
