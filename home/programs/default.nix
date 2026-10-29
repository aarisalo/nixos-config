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
    ./hyperline-deadlock
    ./libreoffice
    ./mangohud
    ./micro
    ./niri
    ./noctalia
    ./obsidian
    ./postman
    ./qalculate
    ./spicetify
    ./vesktop
    ./vscode
  ];
}