# Treasure Hunter / Ground Secrets Concept

## Game Summary

Treasure Hunter, also called Ground Secrets, is a cozy Roblox progression game about exploring calm areas with a metal detector, digging up hidden objects, cleaning and identifying finds, completing a collection log, selling duplicates, upgrading equipment, and unlocking new maps.

The player starts on a simple Beach with a cheap detector. Each new area introduces a different treasure pool and slightly better rewards while keeping the same approachable loop.

## Game Philosophy

- Cozy progression.
- Satisfying repeated actions.
- Exploration without pressure.
- Collecting as a long-term goal.
- Small but meaningful upgrades.
- No feature creep.
- Every feature should strengthen the core gameplay loop.

## Core Loop

1. Scan.
2. Detect a signal.
3. Move closer and dig.
4. Find a dirty or unknown item.
5. Clean the item.
6. Identify the item.
7. Register it in the collection log.
8. Keep it or sell duplicates.
9. Upgrade detector equipment.
10. Unlock new areas.
11. Repeat with new item pools.

## First Playable Prototype

Status: Working, needs polish.

- Player has a basic detector.
- Beach map contains hidden treasure spots.
- Client shows signal strength when near a treasure.
- Player can scan and dig.
- Server validates digging and awards items.
- Inventory is currently a simple server table.
- HUD shows item, rarity, money, selling, and upgrade controls.
- Coins can buy basic range or luck upgrades.

## Approved Core Systems

### Detector System

The detector should make exploration readable and satisfying. The player should understand when they are cold, warm, hot, and ready to dig.

### Item System

Items need stable IDs, names, rarities, values, categories, and map availability. Item data should drive inventory, selling, collection, cleaning, and map progression.

### Inventory

Inventory should track stack counts and duplicates. The player should quickly understand what they found and what can be sold.

### Collection Log

The collection log gives long-term purpose to finds. First-time discoveries should matter more than duplicate sales.

### Cleaning And Identifying

Cleaning and identifying make finds feel more personal. Start with a simple one-button action before considering any minigame.

### Shop And Upgrades

Upgrades should be small and meaningful: range, luck, scan speed, and better detector tiers. Avoid too many stats early.

### World Progression

New areas should unlock through collection progress, coins, or detector strength. Each area should add a new item pool, not a completely different game.

### Save Data

Persistence should save only stable progression data: coins, inventory, collection, upgrades, unlocked maps, and equipped detector.

## Future Maps

- Beach
- Playground
- Forest
- Castle Ruins
- Abandoned Railway
- Snowfield
- Volcano
- Moon

## Feature Validation Rules

Before approving a feature, check:

- Does it improve progression?
- Does it improve replayability?
- Is it worth implementing now?
- Is it realistic for a small development team?
- Is it consistent with the cozy treasure hunting vision?

If the answer is weak, place it in `Possible Future Ideas` in `TODO.md` instead of implementing it.

## What To Avoid

- Competitive systems that pressure the player.
- Large economy systems before the core loop is fun.
- Cosmetic or social systems before collection and progression work.
- Complex minigames before simple cleaning and identifying exist.
- New maps before Beach progression is satisfying.
