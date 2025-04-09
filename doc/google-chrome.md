<!-- markdownlint-configure-file { "no-duplicate-heading": { "siblings_only": true } } -->
# Google Chrome

## Настройка (сохраняется в Google-аккаунте)

- Settings (Настройки):
  - Appearance (Внешний вид):
    - `☑` Show home button (Показывать кнопку "Главная страница")
  - Languages / Spell check:
    - `☑` Russian
  - Downloads (Скаченные файлы):
    - `☑` Ask where to save each file before downloading
- Extensions (Расширения) / Manage Extenstions:
    - `☑` Developer mode - нужен для работы расширения Tampermokey/**Voice Over Translation**
- More tools (Дополнительные инструменты) / Developer tools:
  - Settings (F1)
    - Theme: `Dark`
- Experiments (chrome://flags/)
  - `extensions-on-chrome-urls`: `Enabled`

## Расширения

### [Bitwarden](https://chromewebstore.google.com/detail/bitwarden/nngceckbapebfimnlniiiahkandclblb)

Менеджер паролей.

ВНИМАНИЕ! Требует залогиниться в **свой** аккаунт.

### [Chromium Wheel Smooth Scroller](https://chromewebstore.google.com/detail/chromium-wheel-smooth-scr/khpcanbeojalbkpgpmjpdkjnkfcgfkhb)

Мягкий скролинг страниц мышкой и клавиатурой.

### [DeepL](https://chromewebstore.google.com/detail/deepl/cofdbpoegempjloogbagkncekinflcnj)

Переводчик. Удобен для перевода отдельных абзацев. Очень качественный перевод технических текстов.

### [DragIt!](https://chromewebstore.google.com/detail/dragit/bnmedfjfiggbacggokfddhocaignedbk)

Открытие ссылок в другой закладке перетаскиванием:

- вправо - с переходом на нее
- влево - в фоне

### [FreshStart](https://chromewebstore.google.com/detail/freshstart-cross-browser/nmidkjogcjnnlfimjcedenagjfacpobb)

Менеджер сессий (сессии доступны в том числе из закладок!).

#### Параметры (ВНИМАНИЕ! Требуется ручная настройка)

- `☑` Enable Crash Recovery с интервалом в `5` минут
- Date format: `yyyy-mm-dd`

### [GIF Scrubber](https://chromewebstore.google.com/detail/gif-scrubber/gbdacbnhlfdlllckelpdkgeklfjfgcmp)

Проигрыватель GIF-анимаций.

#### Параметры (ВНИМАНИЕ! Требуется ручная настройка)

- `☑` Open scrubber in new tab instead of new window
- `☐` Start playing as soon as image loads
- `☐` Loop animation
- `☑` Mouse hover automatically scrubs
- Player background: `Dark`

### [Google Translate](https://chromewebstore.google.com/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)

Переводчик. Удобен:

- для _словарного_ перевода слова. Выделяем слово и нажимаем горячую клавишу (`Alt + X`)
- для поиска синонимов английских слов. По горячей клавише (`Alt + X`) вводим слово, нажимаем `Enter` и выбираем
`OPEN IN GOOGLE TRANSLATE`

#### Параметры (ВНИМАНИЕ! Требуется ручная настройка)

- My primary language: `Russian`
- `☑` Don't display icon or pop-up

Настроить горячую клавищу в [Extensions / Keyboard shortcuts](chrome://extensions/shortcuts): `Alt + X`

### [Immersive Translate](https://chromewebstore.google.com/detail/bpoadfkcbjbfhfodiogcnhhhpibjhbnh)

Иммерсионный перевод (одновременное отображение оригинального абзаца и его перевода).
Удобен для перевода страниц целиком и **PDF-документов**.

#### Параметры

TODO: описать настройку

### [MarkDownload](https://chromewebstore.google.com/detail/markdownload-markdown-web/pcmpcfapbekmbjjkdalcgopdkipoggdi) ([GitHub](https://github.com/deathau/markdownload))

Сохранение страниц в формате Markdown. Умеет встраивать картинки в сам md-файл через Base64-кодирование.

#### Параметры (сохраняются в Google-аккаунте)

- Folder inside `Downloads/` to store MarkDownload clips: `MarkDownload`

    Необходимо создать символическую ссылку `~/Download/MarkDownload` на папку `_inbox` внутри Obsidian Vault:

    ```bash
    ln -s ~/1clouds/yandex/obsidian/internet/_inbox ~/Downloads/MarkDownload
    ```

- Front-matter template:

    ```yaml
    ---
    created: {date:YYYY-MM-DD HH:mm}
    source: {baseURI}
    author: {byline}
    tags: [{keywords}]
    ---
    # {title}

    URL: {baseURI}

    > **Краткая выдержка**
    > {excerpt}
    ---
    ```

- `☐` Enable Context Menus
- `☑` Download images alongside markdown files
- `☑` Image Style / Base64 encoded

### [QR Code Generator](https://chromewebstore.google.com/detail/qr-code-generator/hoeiookpkijlnjdafhaclpdbfflelmci)

Генератор и сканер QR-кодов (через Web-камеру).

### [Search Bookmarks, History and Tabs](https://chromewebstore.google.com/detail/search-bookmarks-history/cofpegcepiccpobikjoddpmmocficdjj)

Поиск по закладкам и истории просмотра.

### [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)

Userscript-менеджер. Для установки скрипта закадрового перевода видео [voice-over-translation](https://github.com/ilyhalight/voice-over-translation).

ВНИМАНИЕ! После установки расширения необходимо пройти по этой [ссылке](https://raw.githubusercontent.com/ilyhalight/voice-over-translation/master/dist/vot.user.js)
и нажать кнопку **Install**.

### [Toby Mini](https://chromewebstore.google.com/detail/toby-mini/gfdcgfhkelkdmglklfbndgopaihmoeci)

Менеджер сессий. В отличии от основного расширения (Toby) не заменяет стартовую страницу.

ВНИМАНИЕ! Требует залогиниться в **свой** аккаунт.

#### Параметры (сохраняются в Tobby-аккаунте)

- `☐` Open cards on the same tab
- `☑` Dark Theme
- `☑` Remove duplicate tabs

### [uBlock Origin Lite (uBOL)](https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) ([GitHub](https://github.com/uBlockOrigin/uBOL-home))

Блокировка рекламы на основе Manifest V3. Не потребляет ресурсов.

#### Параметры (ВНИМАНИЕ! Требуется ручная настройка)

- Default filtering mode: `Optimal`

### [Vimium C](https://chromewebstore.google.com/detail/vimium-c-all-by-keyboard/hfjbmagddngcpeloejdejnfgbamkjaeg) ([GitHub](https://github.com/gdh1995/vimium-c))

Управление браузером с помощью клавиш.

Особенности:

- не зависит от раскладки клавиатуры
- работает в новой вкладке

#### Параметры (сохраняются в Google-аккаунте)

- Advanced Options:
  - `☑` Allow in Incognito
  - `☑` Search in bookmarks or add new items
  - `☑` Run on chrome://*/* pages
  - `☑` Run on Chrome's native New Tab Page
  - `▢` Always ignore keyboard layout

## Расширения — кандидаты на вылет

### [Surfingkeys](https://chromewebstore.google.com/detail/surfingkeys/gfbliohnnapiefjpjlpjnehglfpaknnc) ([GitHub](https://github.com/brookhong/Surfingkeys))

Управление браузером с помощью клавиш.

Особенности:

- абсолютно не зависит от раскладки клавиатуры!
- встроенный VIM-редактор для input-полей
- более интуитивная навигация

#### Параметры (сохраняются в Google-аккаунте)

- Options / `☑` Advanced mode:

    ```js
    settings.theme = '\
    .sk_theme { \
        background: #fff; \
        color: #000; \
    } \
    .sk_theme tbody { \
        color: #000; \
    } \
    .sk_theme input { \
        color: #000; \
    } \
    .sk_theme .url { \
        color: #555; \
    } \
    .sk_theme .annotation { \
        color: #555; \
    } \
    .sk_theme .focused { \
        background: #f0f0f0; \
    }';

    settings.hintAlign = 'left';
    settings.showModeStatus = true;

    api.Hints.setCharacters("sdfgwertxcvb")

    api.map('[[', 'S');
    api.map(']]', 'D');
    ```
