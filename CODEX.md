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
- Before writing gameplay code, confirm the relevant TODO item, branch, dependencies, and acceptance criteria.
- A feature is not done until its TODO acceptance criteria are satisfied or the remaining gap is written as a bug or follow-up TODO.
- Prefer one small, testable gameplay change per commit.

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
- Always update `TODO.md` when finishing work.
- When a bug is found and cannot be fixed immediately, add it to `TODO.md` as a bug item with enough detail to reproduce it.
- When the user asks for work, add it to `TODO.md` before or while doing the work.
- When thinking of a possible new feature, add it under a "Possible TODO" section for user review instead of treating it as approved work.
- Move a possible TODO into the real TODO list only after the user approves it.
- If the user asks for tutorials, create them inside `tutorial-output`.
- Do not create `tutorial-output` unless the user asks for a tutorial.

## Planning Rules

- Do not approve a brainstormed idea just because it sounds fun.
- Approve features only when they strengthen scanning, detecting, digging, finding, cleaning, identifying, collecting, selling, upgrading, or unlocking areas.
- Keep rejected ideas documented briefly so they do not keep returning as accidental scope.
- Split approved features into small tasks that fit roughly one coding session.
- Include dependencies and acceptance criteria for approved tasks.
- Keep `Possible Future Ideas` separate from approved TODO items.

## Current Architecture Rules

- Shared data/config belongs in `ReplicatedStorage.Shared.Config`.
- Shared constants such as remote names belong in `ReplicatedStorage.Shared`.
- Server-owned gameplay state belongs in services under `ServerScriptService.Services`.
- Client controllers belong under `StarterPlayerScripts.Controllers`.
- `LocalScript` files should require sibling controller folders through `script.Parent`, not `script`.
- Server should create or validate remotes before clients use them.
- Client UI should fail visibly with a useful message when a required remote or state is missing.

## Testing Expectations

For each feature, explain how to test it in Roblox Studio:

1. Start Rojo with `rojo serve`.
2. Connect Roblox Studio with the Rojo plugin.
3. Press Play.
4. Run the specific gameplay steps for the feature.

## Current Development Style

This project is in prototype phase. Favor direct, understandable code. Add abstractions only when they remove real duplication or clarify boundaries.
