{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    # ./discord
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
    # ./prism
    ./spicetify
    # ./spotify
    ./vesktop
    ./vscode
  ];
}