{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./dolphin
    ./easyeffects
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
    ./spicetify
    ./vesktop
    ./vscode
  ];
}