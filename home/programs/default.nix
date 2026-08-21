{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./discord
    ./dolphin
    ./easyeffects
    ./firefox
    ./fish
    ./flatpak
    ./ghostty
    ./git
    ./mangohud
    ./niri
    ./noctalia
    ./prism
    ./spicetify
    # ./spotify
    ./vscode
  ];
}