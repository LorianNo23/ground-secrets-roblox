# Branching Guide

## Main Branches

- `main`: stable project state.
- `develop`: integration branch for completed feature work.

## Feature Branches

Use feature branches for focused changes:

- `feature/rojo-setup`
- `feature/detector-prototype`
- `feature/treasure-item-config`
- `feature/detector-upgrade-config`
- `feature/server-inventory-service`
- `feature/server-treasure-spot-service`
- `feature/remotes-scan-dig-sell-upgrade`
- `feature/client-detector-controller`
- `feature/basic-hud`
- `feature/beach-treasure-spots`
- `feature/sell-duplicates`
- `feature/range-luck-upgrades`
- `feature/inventory`
- `feature/shop-upgrades`
- `feature/map-unlocks`
- `feature/cleaning-minigame`

## Branch Rules

- Start new gameplay work from `develop` when possible.
- Keep each feature branch focused on one milestone or system.
- Use short, descriptive names in the form `feature/name`.
- Prefer branch names that match TODO item titles, normalized to lowercase kebab-case.
- Build one feature per branch so commits and reviews stay focused.
- Do not mix unrelated refactors into gameplay branches.
- Before merging to `develop`, verify the game opens and runs in Roblox Studio.
- Merge to `main` only when the current playable state is stable.

## Suggested Current Branch

Use `feature/rojo-setup` for the initial Rojo scaffold.
Use `feature/detector-prototype` for the first playable detector loop.
