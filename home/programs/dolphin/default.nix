{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qtsvg
    kdePackages.dolphin
  ];

  xdg.configFile."kdeglobals".source = ../../config/kdeglobals;
}