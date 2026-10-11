## Agent skills

### Issue tracker

Issues are tracked as local markdown files under `.scratch/<feature>/`. See `docs/agents/issue-tracker.md`.

### Triage labels

Default five-role vocabulary (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`). See `docs/agents/triage-labels.md`.

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
