# NixOS configuration

A single-machine NixOS configuration with home-manager, organized by where
each piece of the system lives.

## Language

**Core**:
System configuration that applies to every machine, independent of which
machine it runs on.
_Avoid_: device settings, kernel settings

**Host**:
The machine-specific half of a NixOS configuration: hardware, user, locale,
and everything that may differ between machines.
_Avoid_: machine config

**System module**:
A module in `system/` that lands in the NixOS system profile: packages and
options visible to all users, and the only place privileged or system-wide
services may live.
_Avoid_: root programs

**Home module**:
A home-manager module under `home/` managing the user profile of `akseli`:
user packages, user options, user services.
_Avoid_: user programs

**Program config**:
A declarative config file for a program, kept in `home/config/` and wired in
by the program's home module.
_Avoid_: dotfile
