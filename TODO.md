# Current Sprint

## Stabilize Detector Prototype

Branch: `feature/detector-prototype-polish`

- [x] Verify Rojo sync in Roblox Studio.
  - Acceptance criteria: Player can see the Beach and the detector HUD in Play mode.
  - Dependencies: `feature/detector-prototype`.
- [ ] Add clear scan feedback states.
  - Acceptance criteria: HUD distinguishes no signal, weak signal, strong signal, and dig-ready signal.
  - Dependencies: current detector prototype.
- [ ] Hide or soften visible treasure spot markers.
  - Acceptance criteria: Treasure locations are not obvious rectangles during normal play, but remain debug-friendly if needed.
  - Dependencies: current treasure spot service.
- [ ] Add a simple found-item popup.
  - Acceptance criteria: Digging shows item name, rarity, and value for a few seconds.
  - Dependencies: item config and HUD.
- [ ] Add basic Output diagnostics for client and server startup.
  - Acceptance criteria: Studio Output clearly shows whether server services, remotes, and client controllers started.
  - Dependencies: current server/client entry scripts.

# High Priority

## Item System

Branch: `feature/item-system`

- [ ] Define stable item IDs, display names, rarities, values, and map availability.
  - Acceptance criteria: Each item has an ID, name, rarity, sell value, and allowed map list.
  - Dependencies: existing `TreasureConfig`.
- [ ] Add item metadata fields.
  - Acceptance criteria: Items can define age range, material, default condition range, category, and short description.
  - Dependencies: stable item IDs.
- [ ] Add rarity weight rules per map.
  - Acceptance criteria: Beach rolls mostly common items and rarely higher-tier items.
  - Dependencies: item definitions.
- [ ] Add item categories.
  - Acceptance criteria: Items can be grouped as coin, jewelry, toy, relic, tool, fossil, natural, or oddity.
  - Dependencies: item definitions.

## Inventory

Branch: `feature/inventory`

- [ ] Replace simple inventory list with item stack counts.
  - Acceptance criteria: Finding duplicate stackable items increases count instead of adding duplicate table rows.
  - Dependencies: item system.
- [ ] Track first-time finds separately from duplicate finds.
  - Acceptance criteria: Server can tell whether an item is new to the player.
  - Dependencies: inventory stack counts.
- [ ] Add server API for inventory summary.
  - Acceptance criteria: Client receives item counts, total item count, and total sell value.
  - Dependencies: inventory service.
- [ ] Update HUD inventory display.
  - Acceptance criteria: HUD shows total items and duplicate sell value.
  - Dependencies: inventory summary API.

## Collection Book

Branch: `feature/collection-book`

- [ ] Create server collection tracking.
  - Acceptance criteria: First-time finds are marked discovered in a player collection table.
  - Dependencies: item system and inventory.
- [ ] Add Pokedex-style collection book data.
  - Acceptance criteria: Each entry can show discovered state, item name, rarity, map source, and short flavor text.
  - Dependencies: collection tracking and item metadata.
- [ ] Add simple collection UI tab.
  - Acceptance criteria: Player can see discovered and undiscovered Beach items.
  - Dependencies: collection book data and basic UI.
- [ ] Add collection completion bonuses.
  - Acceptance criteria: Completing a small Beach collection milestone grants coins or a small permanent bonus.
  - Dependencies: collection UI and server reward validation.

## Unique Find History

Branch: `feature/unique-find-history`

- [ ] Add unique find records for non-stackable notable items.
  - Acceptance criteria: A notable find stores item ID, found by, found date, map, condition, age, material, and rarity.
  - Dependencies: item metadata and inventory.
- [ ] Show latest unique find details in the HUD or item popup.
  - Acceptance criteria: Player can see where and when the item was found plus condition and material.
  - Dependencies: unique find record.
- [ ] Keep stackable common duplicates lightweight.
  - Acceptance criteria: Common duplicate stacks do not create unnecessary per-item history records.
  - Dependencies: inventory stack rules.

## Item Condition And Cleaning

Branch: `feature/item-condition-cleaning`

- [ ] Add dirty item state after digging.
  - Acceptance criteria: Newly dug items can enter inventory as dirty or unidentified finds.
  - Dependencies: item system and inventory.
- [ ] Add item condition values.
  - Acceptance criteria: Items can be Poor, Worn, Good, Excellent, or Pristine, and condition can affect sell value.
  - Dependencies: item metadata.
- [ ] Add simple cleaning action.
  - Acceptance criteria: Player can clean a dirty item with one button and receive a short progress delay.
  - Dependencies: dirty item state.
- [ ] Add identify result reveal.
  - Acceptance criteria: Cleaned item reveals final item name, rarity, value, condition, and collection status.
  - Dependencies: cleaning action and item roll result.

## Shop And Detector Upgrades

Branch: `feature/shop-upgrades`

- [ ] Move upgrade definitions into clearer detector tiers and stat upgrades.
  - Acceptance criteria: Range, luck, and scan speed have costs and max levels.
  - Dependencies: current `UpgradeConfig`.
- [ ] Add detector module slots.
  - Acceptance criteria: Detector can equip a small number of module bonuses without replacing the whole upgrade system.
  - Dependencies: detector tier config.
- [ ] Add first simple detector modules.
  - Acceptance criteria: At least one range module and one luck module can be purchased or equipped.
  - Dependencies: module slots.
- [ ] Add shop UI section.
  - Acceptance criteria: Player can see upgrade cost, current level, max level, and disabled state.
  - Dependencies: HUD and upgrade service.
- [ ] Add better detector purchase.
  - Acceptance criteria: Player can buy one better detector tier that improves base range.
  - Dependencies: detector tier config and coin spending.

## Save Data

Branch: `feature/save-data`

- [ ] Define player data schema.
  - Acceptance criteria: Schema covers coins, inventory, collection book, unique find history, upgrades, modules, unlocked maps, and equipped detector.
  - Dependencies: inventory, collection book, upgrades.
- [ ] Add DataStore save/load service.
  - Acceptance criteria: Player data loads on join and saves on leave in published Roblox place testing.
  - Dependencies: player data schema.
- [ ] Add safe defaults and migration version.
  - Acceptance criteria: Missing or old data does not break player join.
  - Dependencies: save/load service.

# Medium Priority

## Digging

Branch: `feature/digging`

- [ ] Add short dig timing.
  - Acceptance criteria: Digging has a short delay and cannot be spammed.
  - Dependencies: detector system and server validation.
- [ ] Add critical dig timing window.
  - Acceptance criteria: A well-timed dig can give a small bonus such as better condition chance or bonus coins.
  - Dependencies: dig timing and item condition.
- [ ] Add dig animation placeholder.
  - Acceptance criteria: Player receives visible feedback while digging.
  - Dependencies: dig timing.
- [ ] Add dig cooldown and server validation.
  - Acceptance criteria: Server rejects repeated dig requests during cooldown.
  - Dependencies: dig timing.

## Detector System

Branch: `feature/detector-system`

- [ ] Split detector scan logic into a shared config and server service.
  - Acceptance criteria: Detector range, scan cooldown, signal thresholds, and dig radius are configurable.
  - Dependencies: current detector prototype.
- [ ] Add scan cooldown.
  - Acceptance criteria: Scan cannot be spammed faster than the configured cooldown.
  - Dependencies: detector service.
- [ ] Add directional hint.
  - Acceptance criteria: HUD can show signal getting warmer or colder compared with previous scan.
  - Dependencies: scan state tracking.
- [ ] Add signal strength sound hooks.
  - Acceptance criteria: Signal strength can drive beep speed or pitch without hardcoding sound behavior into detector logic.
  - Dependencies: signal strength states.

## Ground Types

Branch: `feature/ground-types`

- [ ] Add ground type config.
  - Acceptance criteria: Sand, grass, snow, mud, and stone can define dig difficulty and possible item pools.
  - Dependencies: item system.
- [ ] Assign Beach treasure spots to sand.
  - Acceptance criteria: Beach spots report sand as their ground type.
  - Dependencies: ground type config.
- [ ] Use ground type in scan or dig result text.
  - Acceptance criteria: Player receives a small readable hint such as "Signal under sand."
  - Dependencies: detector feedback.

## UI

Branch: `feature/ui`

- [ ] Replace prototype HUD layout with reusable UI components.
  - Acceptance criteria: HUD has separate sections for detector, inventory, collection, and shop without giant controller code.
  - Dependencies: detector, inventory, shop.
- [ ] Add mobile-friendly buttons.
  - Acceptance criteria: Scan and Dig are easy to tap on mobile.
  - Dependencies: current HUD.
- [ ] Add collection/shop tabs.
  - Acceptance criteria: Player can switch between detector, inventory, collection book, and shop views.
  - Dependencies: inventory and collection book.

## World Progression

Branch: `feature/world-progression`

- [ ] Add area unlock config.
  - Acceptance criteria: Each map has unlock cost, required collection progress, and item pool.
  - Dependencies: item system and collection book.
- [ ] Add Playground as second area.
  - Acceptance criteria: Player can unlock Playground after completing Beach requirements.
  - Dependencies: area unlock config.
- [ ] Add simple teleport or area gate.
  - Acceptance criteria: Player can move between unlocked Beach and Playground.
  - Dependencies: Playground unlock.

## Treasure Maps And Secret Finds

Branch: `feature/treasure-maps`

- [ ] Add treasure map item type.
  - Acceptance criteria: A treasure map can point to one special hidden find in the current area.
  - Dependencies: item system and world progression.
- [ ] Add one Beach treasure map test find.
  - Acceptance criteria: Player can use a map to reveal or hint at a special Beach spot.
  - Dependencies: treasure map item type.
- [ ] Add server validation for map rewards.
  - Acceptance criteria: Client cannot directly claim treasure map rewards.
  - Dependencies: treasure map find flow.

## Relic Sets

Branch: `feature/relic-sets`

- [ ] Define relic set config.
  - Acceptance criteria: A relic set lists required item IDs and a completion reward.
  - Dependencies: item system and collection book.
- [ ] Add one small Beach relic set.
  - Acceptance criteria: Player can complete a small set from multiple found parts.
  - Dependencies: relic set config.
- [ ] Add completion reward.
  - Acceptance criteria: Completing the set grants coins, a title, or unlock progress.
  - Dependencies: server reward validation.

## Audio And Feedback

Branch: `feature/audio-feedback`

- [ ] Add detector beep feedback.
  - Acceptance criteria: Stronger signal produces clearer or faster beep feedback.
  - Dependencies: detector signal strength sound hooks.
- [ ] Add dig and item reveal sounds.
  - Acceptance criteria: Digging and finding an item have simple satisfying sounds.
  - Dependencies: digging and item reveal.
- [ ] Add Lucky Find moment.
  - Acceptance criteria: Rare rolls can trigger a small special message or effect without changing reward fairness.
  - Dependencies: item rarity system.
- [ ] Add rarity color and effect polish.
  - Acceptance criteria: Rare finds feel more special without overwhelming the cozy style.
  - Dependencies: item rarity system.

# Low Priority

## Backpack Limits

Branch: `feature/backpack-limits`

- [ ] Add simple backpack capacity config.
  - Acceptance criteria: Player has a clear item capacity value.
  - Dependencies: inventory.
- [ ] Add full backpack warning.
  - Acceptance criteria: Player sees a clear message before capacity blocks new finds.
  - Dependencies: UI.
- [ ] Add backpack upgrade.
  - Acceptance criteria: Player can increase capacity with coins.
  - Dependencies: shop upgrades.

## NPC Quests

Branch: `feature/npc-quests`

- [ ] Add quest definition config.
  - Acceptance criteria: A quest can request a specific item or category and define a reward.
  - Dependencies: item system and inventory.
- [ ] Add one lost-item quest.
  - Acceptance criteria: Player can turn in one requested Beach item for coins.
  - Dependencies: quest config.
- [ ] Add one collector request.
  - Acceptance criteria: Player can satisfy a simple collector request using duplicate items.
  - Dependencies: inventory and collection book.

## Achievements And Daily Tasks

Branch: `feature/achievements-daily-tasks`

- [ ] Add basic achievement definitions.
  - Acceptance criteria: Achievements can track first dig, first rare, first sell, and first upgrade.
  - Dependencies: save data and gameplay event hooks.
- [ ] Add daily task definitions.
  - Acceptance criteria: Daily tasks can request a small number of digs, sells, or finds.
  - Dependencies: save data and achievement tracking.
- [ ] Add simple reward claim flow.
  - Acceptance criteria: Rewards are granted by the server once per completed task.
  - Dependencies: daily task definitions.

## Map Polish

Branch: `feature/map-polish`

- [ ] Add Beach props.
  - Acceptance criteria: Beach has a few simple nonblocking props like shells, towels, rocks, or driftwood.
  - Dependencies: stable detector prototype.
- [ ] Add spawn and shop stand.
  - Acceptance criteria: Player spawn and shop location are visually understandable.
  - Dependencies: shop UI.
- [ ] Add map boundaries.
  - Acceptance criteria: Player cannot walk off the useful prototype area.
  - Dependencies: Beach layout.

## Economy Balance

Branch: `feature/economy-balance`

- [ ] Tune Beach item values.
  - Acceptance criteria: First upgrade can be earned after a short play session.
  - Dependencies: item system and shop upgrades.
- [ ] Tune upgrade costs.
  - Acceptance criteria: Upgrades feel meaningful but not grindy.
  - Dependencies: upgrade data.
- [ ] Add simple balance notes.
  - Acceptance criteria: `PRIORITY.md` or a future balance doc explains current assumptions.
  - Dependencies: first playtest data.

## Cosmetics

Branch: `feature/cosmetics`

- [ ] Define cosmetic categories.
  - Acceptance criteria: Detector skins, shovel skins, backpacks, titles, and trails are represented as cosmetic-only data.
  - Dependencies: save data.
- [ ] Add one title reward.
  - Acceptance criteria: Player can unlock and equip one non-stat title from collection progress.
  - Dependencies: collection completion bonuses.
- [ ] Add one detector skin.
  - Acceptance criteria: Skin changes appearance only and does not affect stats.
  - Dependencies: detector equipment display.

# Possible Future Ideas

These ideas fit the vision but are not approved for implementation yet.

- Weather events: storm, rain, night, and seasonal changes.
  - Validation: Improves exploration mood and replayability, but should wait until core loop, save data, and at least two areas are stable.
- Museum display with passive income.
  - Validation: Strong collecting fantasy, but passive income can distort economy; revisit after collection book and save data.
- Daily museum requests.
  - Validation: Improves replayability and collecting, but should wait until NPC quests, collection book, and save data exist.
- Tiny cleaning minigame with dirt patches.
  - Validation: Improves the clean-identify loop, but a one-button cleaning action should come first.
- NPC appraiser character.
  - Validation: Adds cozy flavor and can support identifying, but not needed for the first functional loop.
- Secret areas unlocked by keys or relic pieces.
  - Validation: Strong exploration reward, but should wait until world progression and relic sets are proven.
- Area-specific weather ambience.
  - Validation: Improves mood and exploration, but does not strengthen the first playable progression loop enough yet.
- Limited-time event items.
  - Validation: Improves replayability, but too early before persistence and core economy are stable.
- Cosmetic trails.
  - Validation: Fun reward, but visual polish should wait until equipment, collection, and save data are stable.
- Museum display room.
  - Validation: Strong collecting fantasy, but larger scope than the next few milestones.
- Basic monetization: cosmetic-only gamepasses or optional convenience boosts.
  - Validation: Possible later if strictly non-pay-to-win; not appropriate before the free core loop is satisfying.

# Rejected / Not Now

- Trading between players.
  - Reason: Adds economy risk and moderation complexity without strengthening the solo cozy loop yet.
- Pets with stat boosts.
  - Reason: Easy feature creep and overlaps with detector modules and upgrades.
- Complex procedural terrain.
  - Reason: Too expensive for a small team and unnecessary for the first exploration loop.
- Competitive leaderboards.
  - Reason: Pushes the tone away from cozy progression.
- Real-money-style gacha rolls.
  - Reason: Conflicts with the calm collection and exploration fantasy.
- Pay-to-win monetization.
  - Reason: Undermines progression and player trust.
