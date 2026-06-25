# Priority Plan

## Current Status

The first detector prototype works in Roblox Studio. The next goal is to turn the rough prototype into a stable core loop that supports inventory, collection, cleaning, upgrades, and area progression without adding unrelated systems.

## Implementation Order

1. `feature/detector-prototype-polish`
   - Stabilize HUD feedback, scan states, treasure spot visibility, found-item popup, and startup diagnostics.
   - Reason: The current prototype must be readable and testable before layering more systems onto it.

2. `feature/item-system`
   - Define stronger item data, map availability, categories, rarity weights, and values.
   - Reason: Inventory, collection, cleaning, selling, and map progression all depend on stable item definitions.

3. `feature/inventory`
   - Add stack counts, duplicate tracking, and inventory summaries.
   - Reason: Selling duplicates and collection progress need a better server inventory model.

4. `feature/collection-log`
   - Track discovered items and show simple collection progress.
   - Reason: Collecting is a core pillar and gives finds meaning beyond coins.

5. `feature/cleaning-identifying`
   - Add dirty finds, simple cleaning, and reveal flow.
   - Reason: This completes the intended Scan -> Dig -> Find -> Clean -> Identify loop.

6. `feature/shop-upgrades`
   - Improve upgrade data, shop UI, and detector tiers.
   - Reason: Upgrades become more meaningful once the player has inventory and collection goals.

7. `feature/save-data`
   - Persist coins, inventory, collection, upgrades, unlocked maps, and equipped detector.
   - Reason: Persistence should come after the player data shape is stable.

8. `feature/digging`
   - Add dig timing, cooldown, and placeholder animation.
   - Reason: Improves feel after the core data loop is reliable.

9. `feature/detector-system`
   - Refine scan cooldowns, signal thresholds, and warmer/colder hints.
   - Reason: Improves replayability and moment-to-moment scanning.

10. `feature/ui`
    - Split prototype HUD into maintainable UI sections and add tabs.
    - Reason: UI should become cleaner once inventory, collection, and shop surfaces are known.

11. `feature/world-progression`
    - Add map unlocks, Playground, and area gate or teleport.
    - Reason: New areas are strongest after item, collection, save, and upgrade systems exist.

12. `feature/audio-feedback`
    - Add beeps, dig sounds, reveal sounds, and rarity polish.
    - Reason: Audio improves feel but depends on stable gameplay events.

13. `feature/map-polish`
    - Add Beach props, spawn/shop stand, and boundaries.
    - Reason: Visual polish should support tested gameplay spaces.

14. `feature/economy-balance`
    - Tune values, costs, and progression timing.
    - Reason: Balance needs playtest data from the systems above.

## Approved Features

- Detector prototype polish
- Item system
- Inventory
- Collection log
- Cleaning and identifying
- Shop and upgrades
- Save data
- Digging feel
- Detector system refinement
- UI refinement
- World progression
- Audio and feedback
- Map polish
- Economy balance

## Not Approved Yet

Ideas in `TODO.md` under `Possible Future Ideas` are not approved for implementation until the user explicitly accepts them.

## Current Recommendation

Start with `feature/detector-prototype-polish`.

It is the smallest next step, improves the already working prototype, and reduces confusion before adding deeper systems.
