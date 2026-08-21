{ config, pkgs, inputs, lib, ... }:

{
  home.username = "akseli";
  home.homeDirectory = "/home/akseli";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";

  home.pointerCursor = {
    enable = true;
    package = pkgs.vanilla-dmz;
    name = "DMZ-White";
    size = 32;
  };

  imports = [
    ./programs
  ];
}
