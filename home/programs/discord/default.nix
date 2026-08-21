{ config, pkgs, ... }:

{
  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];
}