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
    ./vscode
  ];
}