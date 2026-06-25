# Ground Secrets Roblox

A cozy Roblox treasure hunting progression prototype built with Luau and Rojo.

## Requirements

- Roblox Studio
- Rojo
- Rojo Roblox Studio plugin

## Start Rojo

From the project root:

```powershell
rojo serve
```

Then open Roblox Studio, open or create a place, and connect with the Rojo plugin.

## Project Layout

- `default.project.json`: Rojo project file.
- `src/ReplicatedStorage`: shared modules and remotes.
- `src/ServerScriptService`: server scripts and services.
- `src/StarterPlayer/StarterPlayerScripts`: client scripts and controllers.
- `src/StarterGui`: UI instances.
- `src/Workspace`: synced map/world instances when needed.

## Planning Files

Read these before coding:

- `CONCEPT.md`
- `CODEX.md`
- `PRIORITY.md`
- `TODO.md`
- `BRANCHING.md`

## Current Status

The first detector prototype is implemented on `feature/detector-prototype`.

## Prototype Controls

- Press `E` or click `Scan` to check signal strength.
- Move around the Beach until the signal is strong.
- Press `R` or click `Dig` to dig when close enough.
- Click `Sell Inventory` to sell found items for coins.
- Click `Range` or `Luck` to buy detector upgrades when you have enough coins.

## Prototype Notes

- Treasure spots are created by the server when the game starts.
- Rewards, coins, selling, and upgrades are server-authoritative.
- Inventory is currently an in-memory table and does not save between sessions.
