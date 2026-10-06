{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./artix-games-launcher
    ./dolphin
    ./easyeffects
    ./exiled-exchange-2-desktop
    ./firefox
    ./fish
    ./flatpak
    ./ghostty
    ./git
    ./mangohud
    ./micro
    ./niri
    ./noctalia
    ./obsidian
    ./qalculate
    ./spicetify
    ./vesktop
    ./vscode
  ];
}