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
- [ ] Add rarity weight rules per map.
  - Acceptance criteria: Beach rolls mostly common items and rarely higher-tier items.
  - Dependencies: item definitions.
- [ ] Add item categories.
  - Acceptance criteria: Items can be grouped as coin, jewelry, toy, relic, tool, fossil, or oddity.
  - Dependencies: item definitions.

## Inventory

Branch: `feature/inventory`

- [ ] Replace simple inventory list with item stack counts.
  - Acceptance criteria: Finding duplicate items increases count instead of adding duplicate table rows.
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

## Collection Log

Branch: `feature/collection-log`

- [ ] Create server collection tracking.
  - Acceptance criteria: First-time finds are marked discovered in a player collection table.
  - Dependencies: item system and inventory.
- [ ] Add simple collection UI tab.
  - Acceptance criteria: Player can see discovered and undiscovered Beach items.
  - Dependencies: collection tracking and basic UI.
- [ ] Add collection progress rewards.
  - Acceptance criteria: Completing a small Beach collection milestone grants coins or a small luck bonus.
  - Dependencies: collection UI and reward validation.

## Cleaning And Identifying

Branch: `feature/cleaning-identifying`

- [ ] Add dirty item state after digging.
  - Acceptance criteria: Newly dug items can enter inventory as unidentified dirty finds.
  - Dependencies: item system and inventory.
- [ ] Add simple cleaning action.
  - Acceptance criteria: Player can clean a dirty item with one button and receive a short progress delay.
  - Dependencies: dirty item state.
- [ ] Add identify result reveal.
  - Acceptance criteria: Cleaned item reveals final item name, rarity, value, and collection status.
  - Dependencies: cleaning action and item roll result.

## Shop And Upgrades

Branch: `feature/shop-upgrades`

- [ ] Move upgrade definitions into clearer detector tiers and stat upgrades.
  - Acceptance criteria: Range, luck, and scan speed have costs and max levels.
  - Dependencies: current `UpgradeConfig`.
- [ ] Add shop UI section.
  - Acceptance criteria: Player can see upgrade cost, current level, max level, and disabled state.
  - Dependencies: HUD and upgrade service.
- [ ] Add better detector purchase.
  - Acceptance criteria: Player can buy one better detector tier that improves base range.
  - Dependencies: detector tier config and coin spending.

## Save Data

Branch: `feature/save-data`

- [ ] Define player data schema.
  - Acceptance criteria: Schema covers coins, inventory, collection, upgrades, unlocked maps, and equipped detector.
  - Dependencies: inventory, collection log, upgrades.
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

## UI

Branch: `feature/ui`

- [ ] Replace prototype HUD layout with reusable UI components.
  - Acceptance criteria: HUD has separate sections for detector, inventory, and shop without giant controller code.
  - Dependencies: detector, inventory, shop.
- [ ] Add mobile-friendly buttons.
  - Acceptance criteria: Scan and Dig are easy to tap on mobile.
  - Dependencies: current HUD.
- [ ] Add collection/shop tabs.
  - Acceptance criteria: Player can switch between detector, inventory, collection, and shop views.
  - Dependencies: inventory and collection log.

## World Progression

Branch: `feature/world-progression`

- [ ] Add area unlock config.
  - Acceptance criteria: Each map has unlock cost, required collection progress, and item pool.
  - Dependencies: item system and collection log.
- [ ] Add Playground as second area.
  - Acceptance criteria: Player can unlock Playground after completing Beach requirements.
  - Dependencies: area unlock config.
- [ ] Add simple teleport or area gate.
  - Acceptance criteria: Player can move between unlocked Beach and Playground.
  - Dependencies: Playground unlock.

## Audio And Feedback

Branch: `feature/audio-feedback`

- [ ] Add detector beep feedback.
  - Acceptance criteria: Stronger signal produces clearer or faster beep feedback.
  - Dependencies: detector signal strength.
- [ ] Add dig and item reveal sounds.
  - Acceptance criteria: Digging and finding an item have simple satisfying sounds.
  - Dependencies: digging and item reveal.
- [ ] Add rarity color and effect polish.
  - Acceptance criteria: Rare finds feel more special without overwhelming the cozy style.
  - Dependencies: item rarity system.

# Low Priority

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

# Possible Future Ideas

These ideas fit the vision but are not approved for implementation yet.

- Daily museum requests.
  - Validation: Improves replayability and collecting, but should wait until collection log and save data exist.
- Tiny cleaning minigame with dirt patches.
  - Validation: Improves the clean-identify loop, but a one-button cleaning action should come first.
- NPC appraiser character.
  - Validation: Adds cozy flavor and can support identifying, but not needed for the first functional loop.
- Area-specific weather ambience.
  - Validation: Improves mood and exploration, but does not strengthen progression enough yet.
- Limited-time event items.
  - Validation: Improves replayability, but too early before persistence and core economy are stable.
- Detector cosmetic skins.
  - Validation: Fits progression lightly, but not worth building before equipment stats and collection systems.
- Museum display room.
  - Validation: Strong collecting fantasy, but larger scope than the next few milestones.

# Rejected Ideas

- Trading between players.
  - Reason: Adds economy risk and moderation complexity without strengthening the solo cozy loop yet.
- Pets with stat boosts.
  - Reason: Easy feature creep and overlaps with detector upgrades.
- Complex procedural terrain.
  - Reason: Too expensive for a small team and unnecessary for the first exploration loop.
- Competitive leaderboards.
  - Reason: Pushes the tone away from cozy progression.
- Real-money-style gacha rolls.
  - Reason: Conflicts with the calm collection and exploration fantasy.
