# SotN Autosplitters for Bizhawk Saturn

**Supported emulators for autosplitting:**

 - Bizhawk with Saturnus core version 2.7.0+

## Features

- Automatic start.
- Automatic restart.
- Splits at defeating any boss.
- Split on entering Inverted Castle.

## Usage

- Download https://raw.githubusercontent.com/TalicZealot/SotN-Autosplitters/main/Saturn/MariaAny%25.lua
- Open the game.
- Open the file you downloaded through Tools > Lua Console > Script > Open Script
- If everything went right you should see the message "Connected to LiveSplit"
- If you want to deactivate auto-splits open the lua file and set that split's on value to false like so:
```
["Doppleganger10"] = { on = false, split = false, boss = true },
```

## Bugs

- Let me know of any bugs

## Thanks

- Thanks to [Trysdyn Black](https://github.com/trysdyn) for the base code.