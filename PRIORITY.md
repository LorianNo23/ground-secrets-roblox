# Priority Plan

## Current Status

The first detector prototype works in Roblox Studio. The next goal is to turn the rough prototype into a stable core loop:

Scan -> Dig -> Find Item -> Inventory -> Sell -> Upgrade.

Advanced systems are planned, but the project should not jump to them before the core loop is readable, satisfying, and saveable.

## Implementation Order

1. `feature/detector-prototype-polish`
   - Stabilize HUD feedback, scan states, treasure spot visibility, found-item popup, and startup diagnostics.
   - Reason: The current prototype must be readable and testable before layering more systems onto it.

2. `feature/item-system`
   - Define stronger item data, map availability, categories, metadata, rarity weights, and values.
   - Reason: Inventory, collection book, unique history, cleaning, selling, and map progression all depend on stable item definitions.

3. `feature/inventory`
   - Add stack counts, duplicate tracking, and inventory summaries.
   - Reason: Selling duplicates and collection progress need a better server inventory model.

4. `feature/collection-book`
   - Track discovered items and show Pokedex-style collection progress.
   - Reason: Collecting is a core pillar and gives finds meaning beyond coins.

5. `feature/unique-find-history`
   - Store history for notable finds: found by, found date, map, condition, age, material, and rarity.
   - Reason: Unique history makes special discoveries feel personal, but should stay lightweight.

6. `feature/item-condition-cleaning`
   - Add dirty finds, condition, simple cleaning, and reveal flow.
   - Reason: This completes the intended Scan -> Dig -> Find -> Clean -> Identify loop.

7. `feature/shop-upgrades`
   - Improve upgrade data, shop UI, detector tiers, and simple detector modules.
   - Reason: Upgrades become more meaningful once the player has inventory and collection goals.

8. `feature/save-data`
   - Persist coins, inventory, collection book, unique history, upgrades, modules, unlocked maps, and equipped detector.
   - Reason: Persistence should come after the player data shape is stable.

9. `feature/digging`
   - Add dig timing, critical dig bonus, cooldown, and placeholder animation.
   - Reason: Improves feel after the core data loop is reliable.

10. `feature/detector-system`
    - Refine scan cooldowns, signal thresholds, warmer/colder hints, and sound hooks.
    - Reason: Improves replayability and moment-to-moment scanning.

11. `feature/ground-types`
    - Add sand, grass, snow, mud, and stone as simple modifiers for map/item behavior.
    - Reason: Ground types help areas feel different without creating entirely new mechanics.

12. `feature/ui`
    - Split prototype HUD into maintainable UI sections and add tabs.
    - Reason: UI should become cleaner once inventory, collection, and shop surfaces are known.

13. `feature/world-progression`
    - Add map unlocks, Playground, and area gate or teleport.
    - Reason: New areas are strongest after item, collection, save, and upgrade systems exist.

14. `feature/treasure-maps`
    - Add treasure maps for special hidden finds.
    - Reason: Treasure maps improve exploration, but need stable item and area systems first.

15. `feature/relic-sets`
    - Add multi-part relic sets and rewards.
    - Reason: Relic sets deepen collecting after collection book and item history are stable.

16. `feature/audio-feedback`
    - Add beeps, dig sounds, reveal sounds, Lucky Find moments, and rarity polish.
    - Reason: Audio improves feel but depends on stable gameplay events.

17. `feature/backpack-limits`
    - Add inventory capacity and backpack upgrades.
    - Reason: Capacity can improve sell/upgrade decisions, but should wait until inventory feels good.

18. `feature/npc-quests`
    - Add lost item quests and collector requests.
    - Reason: Quests are useful once item pools, inventory, and collection book are stable.

19. `feature/achievements-daily-tasks`
    - Add achievements and daily tasks.
    - Reason: This supports retention later, but should not distract from the core loop now.

20. `feature/map-polish`
    - Add Beach props, spawn/shop stand, and boundaries.
    - Reason: Visual polish should support tested gameplay spaces.

21. `feature/economy-balance`
    - Tune values, costs, capacity, and progression timing.
    - Reason: Balance needs playtest data from the systems above.

22. `feature/cosmetics`
    - Add cosmetic-only detector skins, shovel skins, backpacks, titles, and possibly trails.
    - Reason: Cosmetics are good rewards but should stay non-stat and come after progression is stable.

## Delayed Until Later

- Weather events and seasons
- Museum display with passive income
- Secret areas from keys or relic pieces
- Daily museum requests
- Cleaning minigame
- NPC appraiser
- Limited-time event items
- Cosmetic trails
- Basic monetization

These are not rejected, but they are not needed for the first playable goal.

## Rejected / Not Now

- Trading
- Stat-boost pets
- Complex procedural terrain
- Competitive leaderboards
- Real-money-style gacha
- Pay-to-win monetization

## Current Recommendation

Start with `feature/detector-prototype-polish`.

It is the smallest next step, improves the already working prototype, and reduces confusion before adding deeper systems.
