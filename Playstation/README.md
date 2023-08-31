# SotN Autosplitter for Bizhawk

**Supported emulators for autosplitting:**

 - Bizhawk with Nymashock core through PSX-Autosplitter.lua

## Features

- Automatic start.
- Automatic restart.
- Automatically start when you gain control of Richter.
- Automatically reset when the player starts playing in a new file and the IGT restarts.
- Splits on acquiring a relic.
- Splits on acquiring a progression item.
- Splits on entering the inverted castle.
- Splits on defeating a boss.
- Splits on entering certain locations.

## Usage

- Download https://raw.githubusercontent.com/TalicZealot/SotN-Autosplitters/main/Playstation/PSX-Autosplitter.lua
- Open the game.
- Open the file you downloaded through Tools > Lua Console > Script > Open Script
- If everything went right you should see the message "Connected to LiveSplit"
- If you want to deactivate auto-splits open the lua file and set that split's on value to false like so:
```
["Doppleganger10"] = { on = false, split = false, boss = true },
```