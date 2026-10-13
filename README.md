# The NOexistenceN of you AND me — web port

A self-hostable HTML5 port of the Steam visual novel *The NOexistenceN of you AND me*
(Unity / Naninovel). It is **not** a Unity WebGL export: the original game is a data-driven
Naninovel visual novel, so the port is a JavaScript re-implementation of the Naninovel runtime
that plays the game's own compiled scripts, sprites, fonts, music, voice clips and movies.

Everything is static files — no server-side code is required.

## Run it

```
node serve.js 8080          # zero-dependency static server (Range requests + gzip)
```
then open <http://localhost:8080/>. On Windows double-click `start.bat`; on Linux/macOS run `./start.sh`.

Any static host works as long as it serves `.ogg`, `.mp4`, `.webp` and `.woff2` with correct MIME types and
supports HTTP Range requests for video:

* **nginx / Docker** – `docker build -t noexistence . && docker run -p 8080:80 noexistence` (see `nginx.conf`)
* **Caddy / Apache / S3 + CDN** – upload the folder as-is.

The first click/tap on the loading screen is required by browsers to unlock audio.

## What is included

| Folder | Contents |
| --- | --- |
| `js/` | engine bundle (script player, actors, UI renderer, audio, menus, mini-games) |
| `data/` | compiled scripts, 15 locales of text, character rigs, UI prefabs as JSON |
| `assets/img` | all sprites / backgrounds / CGs (WebP) |
| `assets/audio` | BGM, SFX and every voice line (Ogg Vorbis; zh / ja / es voice sets) |
| `assets/video` | ending, fake ending and concert movies (H.264 MP4) |
| `assets/fonts` | the game's fonts, subset to the characters actually used (WOFF2) |

## Controls

* Click / Space / Enter / → — continue (completes the current line first)
* Hold **Ctrl** or press **S** — skip, **A** — auto-play, **L** / mouse wheel up — history, **Esc** / right click — menu, **F** — fullscreen
* Progress is auto-saved at chapter ends (`Continue` on the title screen). Settings and unlocked CGs live in `localStorage`.

## Dialogue editor

Open `editor.html` (e.g. <http://localhost:8080/editor.html>) to edit any line, choice, UI string or character name per language.
Edits are stored in named **configs**: *Save / Save as / Delete* keep them in the browser, *Export / Import* move them as
`.noexistence-dialogue.json` files. Tick **Use in game** (or use the ▶ play button on a line) and the game shows your text instead of the original.
To ship a config with the site, put the exported file at `data/dialogue-config.json`; visitors without their own active config get it automatically.
The game also accepts `?config=<name>` (activate a saved config) and `?config=` (back to the original text).

## Notes

* Needs a current Chromium / Firefox / Safari 18.4+ (Ogg Vorbis audio, ES modules).
* Total size is roughly 1.2 GB, mostly audio and video.
* The mini-games (oven QTE, name erasing, repeated click) were rebuilt from the game's UI data; their exact
  scoring rules are re-created, not copied, because the original logic is compiled native code.
* Game content © its original authors. This build is for personal use with a legitimately owned copy — do not redistribute it publicly.
