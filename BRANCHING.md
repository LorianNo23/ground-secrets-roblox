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
- `feature/collection-log`
- `feature/cleaning-identifying`
- `feature/shop-upgrades`
- `feature/save-data`
- `feature/digging`
- `feature/detector-system`
- `feature/ui`
- `feature/world-progression`
- `feature/audio-feedback`
- `feature/map-polish`
- `feature/economy-balance`

## Branch Purpose

### `feature/detector-prototype-polish`

Improve the current prototype without changing the overall architecture: clearer scan states, visible feedback, less obvious treasure markers, and startup diagnostics.

### `feature/item-system`

Make item definitions stable enough for inventory, collection, cleaning, selling, and map-specific drops.

### `feature/inventory`

Track item stacks, duplicate counts, inventory summary data, and sellable value.

### `feature/collection-log`

Track discovered items and display collection progress.

### `feature/cleaning-identifying`

Add the missing clean and identify steps between digging and final collection/selling.

### `feature/shop-upgrades`

Improve detector upgrades and shop presentation.

### `feature/save-data`

Persist the player progression data after the data shape is stable.

### `feature/world-progression`

Unlock new maps and connect area requirements to collection and upgrades.
