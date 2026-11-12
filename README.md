# Arabella

A tsundere demon sealed inside your Mac. She chats and roasts you, and she can also read your mail and calendar, sort your notes, haunt your Telegram and summon lesser demons (small programs she builds for you). She is an experiment made for enthusiasts, not a polished product. Have fun, and expect rough edges.

This repo holds **releases only**: the app, this guide and the installer. The source code isn't public.

- **macOS 14 Sonoma or newer**, on Apple Silicon or Intel.
- The app is signed locally, **not by Apple**, so macOS needs one extra step (below).

## Install

### The quick way (Terminal)

```sh
curl -fsSL https://raw.githubusercontent.com/VitaliyNikolaev777/arabella-daughter/main/install-arabella.sh | zsh
```

The script:
1. downloads the DMG from this repo's latest release;
2. refuses it unless it matches the published SHA-256;
3. copies Arabella to /Applications and opens her.

Files fetched with curl aren't marked as quarantined, so macOS doesn't complain. The same command updates her later: it closes the running copy first, and her data stays.

### By hand

1. Download `Arabella-<version>.dmg` from **[Releases](https://github.com/VitaliyNikolaev777/arabella-daughter/releases/latest)**.
2. Open it and drag **Arabella** into **Applications**.
3. Open her. macOS will refuse, because the app isn't signed by a registered Apple developer.
4. In **System Settings › Privacy & Security**, scroll down to "Arabella was blocked…" and click **Open Anyway**. You only need to do this once.

If that button doesn't appear, or macOS says the app is **"damaged"**, run this in Terminal:

```sh
xattr -cr /Applications/Arabella.app
```

Nothing is broken: macOS says "damaged" about any downloaded app that isn't signed by Apple.

## First launch: bind her to a vessel

She can't speak without a model. Pick one in the summoning circle:

- **Gemini** (the default). The key is free at [aistudio.google.com/apikey](https://aistudio.google.com/apikey), and free use has limits. When she runs out, she complains about "mana".
- **OpenAI, OpenRouter, DeepSeek or Groq**: paste that service's key and pick a model. Through OpenRouter you can also use Claude and many other models.
- **Ollama or LM Studio**: a model running on your own Mac. Nothing leaves the computer, but small models handle her powers badly.

Your key is stored in the macOS Keychain. Your chats, memory and settings stay on your Mac. Only what she reads to answer you is sent to the model you chose.

## Then

- **Settings › Pacts** lists her powers: Mail, Calendar, Notes, files, an Obsidian vault and more. Each one does nothing until macOS grants permission (it asks the first time she tries) or until you set it up. Switch off any you don't want her to have.
- Anything that changes something, such as sending, moving or deleting, shows an **Allow / Deny** card first.
- **Settings › Portals:** connect your own Telegram bot (made with @BotFather) to talk to her from your phone.
- **Settings › Presence › Appearance:** pick one of her looks.
- **Lesser demons** are optional. They need Claude Code (or Codex CLI or Gemini CLI) installed and logged in, and they spend that account's money. Every build asks you first, within a budget you set.

## Updating and removing

- **To update:** run the install command again, or replace the app in Applications with the new one. Your data stays.
- **To remove:** delete the app, then delete `~/Library/Application Support/Arabella` and her items in Keychain Access (search "Arabella").

## Contact

Menu bar › **Contact…** in the app, or write to [arabella@vrnik.com](mailto:arabella@vrnik.com).
