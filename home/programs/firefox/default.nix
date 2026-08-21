{ config, pkgs, ... }:

{
  services.flatpak.packages = [
    "org.mozilla.firefox"
  ];
}