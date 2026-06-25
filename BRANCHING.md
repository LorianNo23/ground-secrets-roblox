# Branching Guide

## Main Branches

- `main`: stable project state.
- `develop`: integration branch for completed feature work.

## Branch Rules

- Use one feature branch per larger feature.
- Keep branches small and focused.
- Use short branch names in the form `feature/name`.
- Prefer branch names that match TODO feature titles, normalized to lowercase kebab-case.
- Do not mix unrelated refactors into gameplay branches.
- Before merging to `develop`, verify the feature in Roblox Studio.
- Merge to `main` only when the current playable state is stable.
- If a bug is discovered inside the current feature, fix it on the current feature branch.
- If a bug belongs to another system and cannot be fixed immediately, add it to `TODO.md`.

## Active Branches

- `feature/rojo-setup`: initial Rojo scaffold and planning files.
- `feature/detector-prototype`: first playable detector prototype.

## Planned Feature Branches

- `feature/detector-prototype-polish`
- `feature/item-system`
- `feature/inventory`
- `feature/collection-book`
- `feature/unique-find-history`
- `feature/item-condition-cleaning`
- `feature/shop-upgrades`
- `feature/save-data`
- `feature/digging`
- `feature/detector-system`
- `feature/ground-types`
- `feature/ui`
- `feature/world-progression`
- `feature/treasure-maps`
- `feature/relic-sets`
- `feature/audio-feedback`
- `feature/backpack-limits`
- `feature/npc-quests`
- `feature/achievements-daily-tasks`
- `feature/map-polish`
- `feature/economy-balance`
- `feature/cosmetics`

## Later Possible Branches

Create these only if the user approves the matching Possible Future Ideas:

- `feature/weather-events`
- `feature/museum`
- `feature/secret-areas`
- `feature/cleaning-minigame`
- `feature/npc-appraiser`
- `feature/limited-time-events`
- `feature/monetization`

## Branch Purpose

### `feature/detector-prototype-polish`

Improve the current prototype without changing the overall architecture: clearer scan states, visible feedback, less obvious treasure markers, and startup diagnostics.

### `feature/item-system`

Make item definitions stable enough for inventory, collection, cleaning, selling, and map-specific drops.

### `feature/inventory`

Track item stacks, duplicate counts, inventory summary data, and sellable value.

### `feature/collection-book`

Track discovered items and display Pokedex-style item progress.

### `feature/unique-find-history`

Store special find metadata such as found by, found date, map, condition, age, material, and rarity.

### `feature/item-condition-cleaning`

Add dirty item state, condition, simple cleaning, and identify reveal.

### `feature/shop-upgrades`

Improve detector upgrades, shop presentation, detector tiers, and simple detector modules.

### `feature/save-data`

Persist the player progression data after the data shape is stable.

### `feature/digging`

Improve dig timing, cooldowns, critical dig bonus, and feedback.

### `feature/detector-system`

Refine scan logic, signal thresholds, scan cooldowns, directional hints, and sound hooks.

### `feature/ground-types`

Add ground type configuration for sand, grass, snow, mud, and stone.

### `feature/world-progression`

Unlock new maps and connect area requirements to collection and upgrades.

### `feature/treasure-maps`

Add treasure maps that lead to special hidden finds.

### `feature/relic-sets`

Add multi-part relic collections with completion rewards.

### `feature/cosmetics`

Add cosmetic-only rewards such as detector skins, shovel skins, backpacks, titles, and trails.
