# Google Chrome

## Настройка

- Settings (Настройки):
  - Appearance (Внешний вид):
    - `☑` Show home button (Показывать кнопку "Главная страница")
  - Languages / Spell check:
    - `☑` Russian
  - Downloads (Скаченные файлы):
    - `☑` Ask where to save each file before downloading
- More tools (Дополнительные инструменты) / Developer tools:
  - Settings (F1)
    - Theme: `Dark`

## Расширения

### [Bitwarden](https://chromewebstore.google.com/detail/bitwarden/nngceckbapebfimnlniiiahkandclblb)

Менеджер паролей.

### [Chromium Wheel Smooth Scroller](https://chromewebstore.google.com/detail/chromium-wheel-smooth-scr/khpcanbeojalbkpgpmjpdkjnkfcgfkhb)

Мягкий скролинг страниц мышкой и клавиатурой.

### [DeepL](https://chromewebstore.google.com/detail/deepl/cofdbpoegempjloogbagkncekinflcnj)

Переводчик.

### [DragIt!](https://chromewebstore.google.com/detail/dragit/bnmedfjfiggbacggokfddhocaignedbk)

Открытие ссылок в другой закладке перетаскиванием:

- вправо - с переходом на нее
- влево - в фоне

### [FreshStart](https://chromewebstore.google.com/detail/freshstart-cross-browser/nmidkjogcjnnlfimjcedenagjfacpobb)

Менеджер сессий (сессии доступны в том числе из закладок!).

#### Параметры

- `☑` Enable Crash Recovery с интервалом в `5` минут
- Date format: `yyyy-mm-dd`

### [GIF Scrubber](https://chromewebstore.google.com/detail/gif-scrubber/gbdacbnhlfdlllckelpdkgeklfjfgcmp)

Проигрыватель GIF-анимаций.

#### Параметры

- `☑` Open scrubber in new tab instead of new window
- `⎅` Start playing as soon as image loads
- `⎅` Loop animation
- `☑` Mouse hover automatically scrubs
- Player background: `Dark`

### [Google Translate](https://chromewebstore.google.com/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)

Для поиска синонимов английских слов. По горячей клавише вводим слово, нажимаем Enter и выбираем
`OPEN IN GOOGLE TRANSLATE`.

#### Параметры

- My primary language: `Russian`
- `☑` Don't display icon or pop-up

Настроить горячую клавищу в [Extensions / Keyboard shortcuts](chrome://extensions/shortcuts): `Alt + X`

### [QR Code Generator](https://chromewebstore.google.com/detail/qr-code-generator/hoeiookpkijlnjdafhaclpdbfflelmci)

Генератор и сканер QR-кодов (через Web-камеру).

### [Search Bookmarks, History and Tabs](https://chromewebstore.google.com/detail/search-bookmarks-history/cofpegcepiccpobikjoddpmmocficdjj)

Поиск по закладкам и истории просмотра.

### [Surfingkeys](https://chromewebstore.google.com/detail/surfingkeys/gfbliohnnapiefjpjlpjnehglfpaknnc) ([GitHub](https://github.com/brookhong/Surfingkeys))

Управление браузером с помощью клавиш.

Особенности:

- абсолютно не зависит от раскладки клавиатуры!
- встроенный VIM-редактор для input-полей
- более интуитивная навигация

#### Параметры

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

### [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)

Userscript-менеджер.

Для установки скрипта закадрового перевода видео [voice-over-translation](https://github.com/ilyhalight/voice-over-translation)
необходимо после установки расширения пройти по этой [ссылке](https://raw.githubusercontent.com/ilyhalight/voice-over-translation/master/dist/vot.user.js) и нажать кнопку **Install**.

### [Toby Mini](https://chromewebstore.google.com/detail/toby-mini/gfdcgfhkelkdmglklfbndgopaihmoeci)

Менеджер сессий. В отличии от основного расширения (Toby) не заменяет стартовую страницу.

#### Параметры

- `⎅` Open cards on the same tab
- `☑` Dark Theme
- `☑` Remove duplicate tabs

### [uBlock Origin Lite (uBOL)](https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh) ([GitHub](https://github.com/uBlockOrigin/uBOL-home))

Блокировка рекламы на основе Manifest V3. Не потребляет ресурсов.

#### Параметры

- Default filtering mode: `Optimal`

## Расширения — кандидаты на вылет

### [SmartAdblock](https://chrome.google.com/webstore/detail/smartadblock/fofomggefchbeiemhdhacdojbefmkhfb/)

Блокировка рекламы. Потребляет еще меньше памяти и умеет обходить обнаружение блокировщика рекламы.

### [XTranslate](https://chrome.google.com/webstore/detail/xtranslate/gfgpkepllngchpmcippidfhmbhlljhoo)

Причина: нарушает политику Chrome Web Store

Перевод слов, выделенных фраз и целых абзацев.

Особенности:

- можно выбрать переводчик (Google, Yandex, Bing)
- при выделении текста появляется иконка перевода
- при двойном клике на абзац перевод появляется автоматически
- при нажатии на иконку расширения на панели расширений
  появляется диалог, в который можно ввести произвольную
  фразу и перевести её (En 🠖 Ru, Ru 🠖 En)

#### Параметры

- `⎅` Display copy-translation icon
- `⎅` Display detected language
- `⎅` Display close-popup icon at the right corner
