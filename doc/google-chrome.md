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

### [Chromium Wheel Smooth Scroller](https://chrome.google.com/webstore/detail/chromium-wheel-smooth-scr/khpcanbeojalbkpgpmjpdkjnkfcgfkhb)

Мягкий скролинг страниц мышкой и клавиатурой.

### [DragIt!](https://chrome.google.com/webstore/detail/dragit/bnmedfjfiggbacggokfddhocaignedbk)

Открытие ссылок в другой закладке перетаскиванием:

- вправо - с переходом на нее
- влево - в фоне

### [FreshStart](https://chrome.google.com/webstore/detail/freshstart-cross-browser/nmidkjogcjnnlfimjcedenagjfacpobb)

Менеджер сессий (сессии доступны в том числе из закладок!).

#### Параметры

- `☑` Enable Crash Recovery с интервалом в `5` минут
- Date format: `yyyy-mm-dd`

### [GIF Scrubber](https://chrome.google.com/webstore/detail/gif-scrubber/gbdacbnhlfdlllckelpdkgeklfjfgcmp/)

Проигрыватель GIF-анимаций.

#### Параметры

- `☑` Open scrubber in new tab instead of new window
- `⎅` Start playing as soon as image loads
- `⎅` Loop animation
- `☑` Mouse hover automatically scrubs

### [QR Code Generator](https://chrome.google.com/webstore/detail/qr-code-generator/hoeiookpkijlnjdafhaclpdbfflelmci)

Генератор и сканер QR-кодов (через Web-камеру).

### [SmartAdblock](https://chrome.google.com/webstore/detail/smartadblock/fofomggefchbeiemhdhacdojbefmkhfb/)

Блокировка рекламы. Потребляет еще меньше памяти и умеет обходить обнаружение блокировщика рекламы.

### [Surfingkeys](https://chrome.google.com/webstore/detail/surfingkeys/gfbliohnnapiefjpjlpjnehglfpaknnc) ([GitHub](https://github.com/brookhong/Surfingkeys))

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

### [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)

Userscript-менеджер.

Для установки скрипта закадрового перевода видео [voice-over-translation](https://github.com/ilyhalight/voice-over-translation)
необходимо после установки расширения пройти по этой [ссылке](https://raw.githubusercontent.com/ilyhalight/voice-over-translation/master/dist/vot.user.js) и нажать кнопку **Install**.

### [Toby Mini](https://chrome.google.com/webstore/detail/toby-mini/gfdcgfhkelkdmglklfbndgopaihmoeci)

Менеджер сессий. В отличии от основного расширения (Toby) не заменяет стартовую страницу.

### [XTranslate](https://chrome.google.com/webstore/detail/xtranslate/gfgpkepllngchpmcippidfhmbhlljhoo)

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
