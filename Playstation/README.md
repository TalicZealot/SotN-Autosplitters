# SotN Autosplitter for Bizhawk

**Supported emulators for autosplitting:**

 - Bizhawk with Nymashock core through PSX-Autosplitter.lua or Octoshock(asl) core through SOTNautosplitter.asl.

### Features

- Automatic start.
- Automatic restart.
- Automatically start when you gain control of Richter.
- Automatically reset when the player starts playing in a new file and the IGT restarts.
- Splits on acquiring a relic.
- Splits on acquiring a progression item.
- Splits on entering the inverted castle.
- Splits on defeating a boss.
- Splits on entering certain locations.

## Table of Contents

- [Symphony of the Night Randomizer Tools](#symphony-of-the-night-randomizer-tools)
  - [Table of Contents](#table-of-contents)
  - [Nymashock](#Nymashock)
  - [Octoshock](#Octoshock)

## Nymashock

### Usage

- Download https://raw.githubusercontent.com/TalicZealot/SotN-Autosplitters/main/Playstation/PSX-Autosplitter.lua
- Open the game.
- Open the file you downloaded through Tools > Lua Console > Script > Open Script
- If everything went right you should see the message "Connected to LiveSplit"
- If you want to deactivate auto-splits open the lua file and set that split's on value to false like so:
```
["Doppleganger10"] = { on = false, split = false, boss = true },
```

## Octoshock

- [LiveSplit](http://livesplit.github.io/) - Here you can find out more about and download LiveSplit. It is a popular timer program typically used for speedruns.
- [ASL](https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md) - Here you can find more information about ASL (basically C#) and autosplitters in general.

### Installation 

- Go to "Edit Splits.." in LiveSplit
- Enter the name of the game in "Game Name"
  - This must be entered correctly for LiveSplit to know which script to load
- Click the "Activate" button to download and enable the autosplitter script
  - If you ever want to stop using the autosplitter altogether, just click "Deactivate"

### Manual Installation (skip if you used the 'Activate' Button)

- Download https://raw.githubusercontent.com/TalicZealot/SotN-Autosplitters/master/Playstation/SOTNautosplitter.asl
- Edit Layout
- Add Other /Scriptable Componment / Script Path: Browse to the "SOTNautosplitter.asl" file you downloaded previously
- Enable Start/Split feature here

### Set-up (if auto-installed)

- Go to "Edit Splits..." in LiveSplit
- Click "Settings" to configure the autosplitter
  - **Note:** If for some reason LiveSplit does not automatically load the script, click "Browse...", navigate to "\LiveSplit\Components\" and select the appropriate script.
- Enable Start/Split feature here

Here you can enable/disable the options for auto start and auto splitting.

## Bugs

- Let me know of any bugs

## Thanks

- Thanks to [Coltaho](https://github.com/Coltaho) for the base BizHawk autosplitter code.