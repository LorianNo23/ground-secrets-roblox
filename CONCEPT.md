# Treasure Hunter / Ground Secrets Concept

## Game Summary

Treasure Hunter, also called Ground Secrets, is a cozy Roblox progression game about exploring calm areas with a metal detector, digging up hidden objects, cleaning and identifying finds, completing a collection book, selling duplicates, upgrading equipment, and unlocking new maps.

The player starts on a simple Beach with a cheap detector. Each new area introduces different ground types, treasure pools, and light progression goals while keeping the same approachable loop.

## Game Philosophy

- Cozy progression.
- Satisfying repeated actions.
- Exploration without pressure.
- Collecting as a long-term goal.
- Small but meaningful upgrades.
- No feature creep.
- Every feature should strengthen the core gameplay loop.

## First Playable Goal

The first playable goal is still intentionally small:

Scan -> Dig -> Find Item -> Inventory -> Sell -> Upgrade.

Do not build advanced systems until this loop is readable and satisfying.

## Full Core Loop

1. Scan.
2. Detect a signal.
3. Move closer and dig.
4. Find a dirty or unknown item.
5. Clean the item.
6. Identify the item.
7. Register it in the collection book.
8. Keep it or sell duplicates.
9. Upgrade detector equipment or modules.
10. Unlock new areas.
11. Repeat with new ground types and item pools.

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

Signal strength should eventually drive both UI feedback and detector sounds.

### Item System

Items need stable IDs, names, rarities, values, categories, map availability, material, condition range, age range, and short flavor text.

Item data should drive inventory, selling, collection book entries, cleaning, unique find history, relic sets, quests, and map progression.

### Inventory

Inventory should track stack counts and duplicates. Common stackable items should stay lightweight. Notable rare finds can keep unique history.

### Collection Book

The collection book is the Pokedex-style long-term record of discovered items. It should show discovered and undiscovered entries, map source, rarity, and completion progress.

Collection completion bonuses are approved because they directly reward collecting.

### Unique Find History

Special finds can record:

- Found by
- Found date
- Map
- Condition
- Age
- Material
- Rarity

This should be used for notable items only, not every common duplicate.

### Item Condition And Cleaning

Cleaning and identifying make finds feel more personal. Start with a simple one-button cleaning action and condition reveal before considering a minigame.

Condition can affect sell value and collection interest.

### Shop, Upgrades, And Detector Modules

Upgrades should be small and meaningful: range, luck, scan speed, and better detector tiers.

Detector modules are approved as a later upgrade layer, but they should stay simple: a few slots and clear bonuses. They should not become a large equipment system early.

### Digging Feel

Digging should have a short timing moment, cooldown, and feedback. A critical dig or perfect timing bonus can be used later for a small condition or coin bonus.

### Ground Types

Ground types make maps feel different without changing the whole game:

- Sand
- Grass
- Snow
- Mud
- Stone

Each ground type can affect dig difficulty, item pools, and feedback text.

### World Progression

New areas should unlock through collection progress, coins, detector strength, or later special keys/relic pieces. Each area should add a new item pool and ground type mix, not a completely different game.

### Treasure Maps

Treasure maps can create special hidden finds and stronger exploration moments. They should come after item and area systems are stable.

### Relic Sets

Relic sets are multi-part collection goals. They should use existing item and collection systems rather than becoming a separate game.

### NPC Quests

NPC lost-item quests and collector requests can guide players toward useful goals, but should wait until item, inventory, and collection systems exist.

### Save Data

Persistence should save stable progression data:

- Coins
- Inventory
- Collection book
- Unique find history
- Upgrades and detector modules
- Unlocked maps
- Equipped detector
- Cosmetics
- Achievement and daily task progress when those systems exist

### Cosmetics

Cosmetics are allowed later if they are not pay-to-win:

- Detector skins
- Shovel skins
- Backpacks
- Titles
- Trails

Cosmetics should support collection and progression rewards before monetization.

## Future Maps

- Beach
- Playground
- Forest
- Castle Ruins
- Abandoned Railway
- Snowfield
- Volcano
- Moon

## Delayed Ideas

These fit the vision but should not be built yet:

- Weather events and seasons
- Museum display with passive income
- Secret areas from keys or relic pieces
- Daily museum requests
- Cleaning minigame
- NPC appraiser
- Limited-time event items
- Basic monetization

## Monetization Direction

If monetization is considered later, it must avoid pay-to-win.

Allowed later:

- Cosmetic-only passes
- Extra display slots if museum exists
- Optional convenience that does not bypass core progression

Avoid:

- Paid rare item rolls
- Paid luck advantages
- Paid exclusive progression power

## Feature Validation Rules

Before approving a feature, check:

- Does it improve progression?
- Does it improve replayability?
- Is it worth implementing now?
- Is it realistic for a small development team?
- Is it consistent with the cozy treasure hunting vision?
- Does it strengthen scan, dig, find, collect, sell, upgrade, or unlock?

If the answer is weak, place it in `Possible Future Ideas` in `TODO.md` instead of implementing it.

## What To Avoid

- Competitive systems that pressure the player.
- Large economy systems before the core loop is fun.
- Cosmetic or social systems before collection and progression work.
- Complex minigames before simple cleaning and identifying exist.
- New maps before Beach progression is satisfying.
- Pay-to-win monetization.
