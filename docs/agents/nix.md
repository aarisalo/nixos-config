# NixOS configuration

This repo is a NixOS flake for one machine, `nixpc`, plus a home-manager
configuration for the user `akseli`.

## Flake

`flake.nix` assembles the `nixpc` system from:

- `hosts/nixpc/` — the machine module. Imports `core/`. Contains
  `hardware-configuration.nix`, locale/keyboard, the `akseli` user, and fonts.
- `system/` — system-profile modules.
- home-manager — configured **inline in `flake.nix`** (`useGlobalPkgs`,
  `useUserPackages`, user `akseli`), importing `home/`.
- Third-party NixOS modules (noctalia, noctalia-greeter, crossmacro) and the
  cachyos kernel overlay, also wired in `flake.nix`.

New flake inputs go in `flake.nix`; `inputs` is passed through `specialArgs`
(and `extraSpecialArgs` for home-manager), so any module can reference
`inputs.<name>` directly.

A new host would be a new `nixosConfigurations.<name>` entry plus a
`hosts/<name>/` that imports `core/`. No second machine is currently planned.

## Directories

### `core/`

System configuration that applies to every machine: audio, bluetooth, boot,
devices, filesystem, graphics, hibernation, network, nix, security, swap.
Each subdirectory is one module, imported from `core/default.nix`.

### `hosts/`

Machine-specific configuration. Only `nixpc/` exists. Note it also holds
personal preferences (locale, keyboard, fonts, user definition) — they live
here because they are per-machine in practice.

### `system/`

Modules that land in the NixOS system profile: packages and options visible
to all users, and the only place for privileged or system-wide services.
Not every entry is a program: `variables` (environment variables), `greeter`,
`appimage`, and `xwayland` are infrastructure modules. Each subdirectory is
imported from `system/default.nix`.

### `home/`

Home-manager for `akseli`. `home/default.nix` imports:

- `programs/` — one module per program (`default.nix` lists them). A program
  module may sit in both `system/` and `home/`: system options in the former,
  user options and config in the latter (see `niri`).
- `userservices/` — systemd **user** services (system services belong in
  `system/`).

### `home/config/`

Declarative program config files, named the way the program expects them
(e.g. `niri.kdl`). They have no effect on their own: each is wired in by the
program's home module via `xdg.configFile`
(e.g. `home/programs/niri` → `xdg.configFile."niri/config.kdl"`).

## Placing a new module

1. NixOS system option, or anything privileged/system-wide → new directory in
   `system/`, add it to `system/default.nix`.
2. User package or home-manager option → new directory in `home/programs/`,
   add it to `home/programs/default.nix`. User service → `home/userservices/`.
3. Program config file → `home/config/`, wire it in the program's home module.
4. Applies to every machine → `core/` (and `core/default.nix`). Specific to
   one machine → `hosts/<name>/`.
