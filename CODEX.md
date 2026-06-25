# Codex Project Instructions

## Required Reading

Before making code changes, read these root planning files:

- `CONCEPT.md`
- `CODEX.md`
- `PRIORITY.md`
- `TODO.md`
- `BRANCHING.md`

Follow them unless the user gives a newer instruction.

## Technical Rules

- Use Luau for Roblox code.
- Use Rojo as the project structure.
- Keep code modular and readable.
- Prefer small ModuleScripts over large scripts.
- Avoid overengineering early prototypes.
- Do not delete working systems without explaining why.
- Keep server authority for inventory, coins, item rolls, upgrades, and map unlocks.
- Keep client code responsible for UI, input, and local presentation.

## Rojo Layout

Use this standard layout:

- `src/ReplicatedStorage`
- `src/ServerScriptService`
- `src/StarterPlayer/StarterPlayerScripts`
- `src/StarterGui`
- `src/Workspace` when map or world instances are needed

Shared modules should usually live under `src/ReplicatedStorage/Shared`.
RemoteEvents and RemoteFunctions should live under `ReplicatedStorage/Remotes`.
Server services should live under `src/ServerScriptService/Services`.
Client controllers should live under `src/StarterPlayer/StarterPlayerScripts/Controllers`.

## Remote Contract Rules

- Create clear names for each RemoteEvent and RemoteFunction.
- Validate all client requests on the server.
- Never let the client directly choose rewards, item rarity, coin payouts, or upgrade success.
- Keep remote payloads simple tables with documented fields.

## Documentation Rules

- Keep the five root planning files current.
- When a meaningful feature is added, update `TODO.md` and `PRIORITY.md` if priorities change.
- If the user asks for tutorials, create them inside `tutorial-output`.
- Do not create `tutorial-output` unless the user asks for a tutorial.

## Testing Expectations

For each feature, explain how to test it in Roblox Studio:

1. Start Rojo with `rojo serve`.
2. Connect Roblox Studio with the Rojo plugin.
3. Press Play.
4. Run the specific gameplay steps for the feature.

## Current Development Style

This project is in prototype phase. Favor direct, understandable code. Add abstractions only when they remove real duplication or clarify boundaries.

