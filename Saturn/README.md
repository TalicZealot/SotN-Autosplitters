# SotN Autosplitters for Bizhawk Saturn

**Supported emulators for autosplitting:**

 - Bizhawk with Saturnus core version 2.7.0+

**Maria All Bosses script coming in the future**

## Features

- Automatic start.
- Automatic restart.
- Splits at defeating Hippogryph, Medusa, Shaft.
- Split on entering Inverted Castle.

## Usage

- Download https://raw.githubusercontent.com/TalicZealot/SotN-Autosplitters/master/Saturn/MariaAny%.lua
- Open LiveSplit and set up your splits as follows: Hippogryph, Inverted Castle, Medusa, Shaft
- Open the game.
- Open the file you downloaded through Tools > Lua Console > Script > Open Script
- If everything went right you should see the message "Connected to LiveSplit"
- If you want to deactivate auto-splits open the lua file and set that split to off like so:
```
splits["Hippogryph"] =
{
    on = **false**,
    split = false
}
```

## Bugs

- Let me know of any bugs

## Thanks

- Thanks to [Trysdyn Black](https://github.com/trysdyn) for the base code.