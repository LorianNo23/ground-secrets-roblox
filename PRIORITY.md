# Priority Plan

## Current Goal

Create the initial Rojo project and prepare for the first playable detector prototype.

## Milestone 0: Project Setup

Status: Complete

- Create Rojo project file.
- Create standard Roblox source folders.
- Add starter server, client, and shared module locations.
- Add required planning documents.
- Document how to run Rojo and connect Roblox Studio.

## Milestone 1: Detector Prototype

Status: Current

Branch: `feature/detector-prototype`

Build the smallest playable loop on Beach:

- Server creates or loads hidden treasure spots.
- Client can scan with keyboard or click.
- Client receives signal strength feedback.
- Server validates dig distance.
- Server awards one rolled item.
- Inventory and coins are stored in a simple server table.
- UI shows coins, last found item, rarity, and sell action.
- Shop supports range or luck upgrade.

## Later Milestones

1. Inventory and collection log.
2. Shop upgrades and better detector tiers.
3. Map unlocks and map-specific treasure pools.
4. Cleaning or identification minigame.
5. Data persistence with DataStore.
6. Polish pass for sound, animation, effects, and UI.

## What Not To Build Yet

- Full economy balancing.
- Trading.
- Pets.
- Daily quests.
- Complex procedural generation.
- DataStore persistence before the local prototype is fun.
