# Arabella

An AI assistant that lives on your Mac. It chats with you, reads your mail and calendar, keeps your tasks and notes, answers on Telegram and Discord, and builds small helper programs for you. Choose who lives there: **Maya** (warm, organised), **Kip** (deadpan, efficient) or **Barnaby** (cheerful, eager). It's an early release for enthusiasts, not a polished product. Have fun, and expect rough edges.

This repo holds **releases only**: the app, this guide and the installer. The source code isn't public.

- **macOS 14 Sonoma or newer**, on Apple Silicon or Intel.
- The app is signed locally, **not by Apple yet**, so macOS needs one extra step (below).
- **Free.** The app, every character, Telegram and Discord are free; you bring your own AI key.

## Two editions

| | |
|---|---|
| **Arabella** (`Arabella-<version>.dmg`) | Comes with two helpers ready to use: a meal and macro tracker, and a training and physio log. |
| **Arabella Pure** (`Arabella-Pure-<version>.dmg`) | The same assistant with no bundled helpers. It's a separate app, so both can live side by side. |

## Install

### The quick way (Terminal)

```sh
curl -fsSL https://raw.githubusercontent.com/VitaliyNikolaev777/arabella-daughter/main/install-arabella.sh | zsh
```

For the Pure edition:

```sh
curl -fsSL https://raw.githubusercontent.com/VitaliyNikolaev777/arabella-daughter/main/install-arabella.sh | ARABELLA_EDITION=pure zsh
```

The script:
1. downloads the DMG from this repo's release;
2. refuses it unless it matches the published SHA-256;
3. copies the app to /Applications and opens it.

Files fetched with curl aren't marked as quarantined, so macOS doesn't complain. The same command updates the app later: it closes the running copy first, and your data stays.

### By hand

1. Download the DMG from **[Releases](https://github.com/VitaliyNikolaev777/arabella-daughter/releases/latest)**.
2. Open it and drag the app into **Applications**.
3. Open the app. macOS will refuse, because the app isn't signed by a registered Apple developer yet.
4. In **System Settings › Privacy & Security**, scroll down to "… was blocked" and click **Open Anyway**. You only need to do this once.

If that button doesn't appear, or macOS says the app is **"damaged"**, run this in Terminal (for the Pure edition, use `"/Applications/Arabella Pure.app"`):

```sh
xattr -cr /Applications/Arabella.app
```

Nothing is broken: macOS says "damaged" about any downloaded app that isn't signed by Apple.

## First launch

Pick a character, then a model:

- **Gemini** (the default). The key is free at [aistudio.google.com/apikey](https://aistudio.google.com/apikey), and free use has limits.
- **OpenAI, OpenRouter, DeepSeek or Groq.** Paste that service's key and pick a model. Through OpenRouter you can also use Claude and many other models.
- **Ollama or LM Studio.** A model running on your own Mac. Nothing leaves the computer, but small models handle the assistant's tools badly.

Your key is stored in the macOS Keychain. Your chats, memory and settings stay on your Mac. Only what the assistant reads to answer you is sent to the model you chose.

## Then

- **Settings › Connections** lists what it can use: Mail, Calendar, Reminders, Notes, files, an Obsidian vault and more. Each one does nothing until macOS grants permission (it asks the first time) or until you set it up. Switch off any you don't want it to have.
- **Changes need your approval.** Anything that changes something (sending, moving or deleting) shows an **Allow / Deny** card first.
- **Settings › Channels:** connect your own Telegram bot (made with @BotFather) or Discord bot to talk to it from your phone.
- **Agents (optional):** small programs it builds for you. They need Claude Code, Codex CLI or Gemini CLI installed and logged in, and they spend that account's money. Every build asks you first, within a budget you set.

## Coming soon

These arrive with the Apple-signed release:

- **Pocket Pass:** a private phone page for your assistant, end-to-end encrypted, no Telegram needed. Plans and prices are at [arabella.vrnik.com/pricing](https://arabella.vrnik.com/pricing). Until then, Pocket is free during early access.
- **Arabella, the unlockable character:** the original dramatic demon, as a fourth character next to Maya, Kip and Barnaby.

Want **a character of your own**, built for you? Menu bar › **Order a custom Arabella…**, or write to [arabella@vrnik.com](mailto:arabella@vrnik.com).

## Updating and removing

- **To update:** run the install command again, or replace the app in Applications with the new one. Your data stays.
- **To remove:** delete the app, then delete `~/Library/Application Support/Arabella` (or `Arabella Pure`) and the app's items in Keychain Access (search "Arabella").

## Contact and legal

Menu bar › **Contact…** in the app, or write to [arabella@vrnik.com](mailto:arabella@vrnik.com).

[Terms](https://arabella.vrnik.com/terms) · [Privacy](https://arabella.vrnik.com/privacy) · [Refunds](https://arabella.vrnik.com/refunds)
