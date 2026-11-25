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
    ./gdre-tools
    ./git
    ./godotsteam
    ./libreoffice
    ./mangohud
    ./micro
    ./niri
    ./noctalia
    ./obsidian
    ./postman
    ./protonplus
    ./qalculate
    ./spicetify
    ./thunderbird
    ./vesktop
    ./vintagestory
    ./vscode
  ];
}