## Agent skills

### Domain docs

Single-context: `GLOSSARY.md` and `docs/adr/` at the repo root. See `docs/agents/domain.md`.

## Repo layout

NixOS flake + home-manager. One machine (`nixpc`), one user (`akseli`).

Placement rules for new modules:

- NixOS system options/packages (system profile, may be privileged) → `system/`
- home-manager options for `akseli` (user packages, user services) → `home/`
- Declarative program config files → `home/config/`, wired in by the program's home module
- Configuration that applies to every machine → `core/`
- Machine-specific configuration → `hosts/<name>/`

A program may legitimately have a module in both `system/` and `home/` (see `niri`).
Terminology in `GLOSSARY.md`. Details in `docs/agents/nix.md`.

## Git and NixOS rebuild

Git rules:

- Do not run any git commands, if changes need to be applied user runs git commands

NixOS rebuilds

- Do not try to run any nixos-rebuild or nixos flake commands, if rebuild or flake updates are needed prompt user to do so

## MCP servers

MCP-NixOS exposes two (yes, two) MCP tools to your AI assistant:

    nix — one unified query tool for search, info, stats, option browsing, channels, flake inputs, and binary cache lookups across every source below.
    nix_versions — package version history with nixpkgs commit hashes via NixHub.io.