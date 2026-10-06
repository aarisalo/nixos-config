{ pkgs, ... }:

let
  icon = "/home/akseli/Pictures/Icons/logo-artixdragon-red.png";
in
{
  xdg.desktopEntries."artix-games-launcher" = {
    name = "Artix Games Launcher";
    comment = "Launcher for Artix Games";
    exec = "artix-games-launcher --mangohud";
    icon = "${icon}";
    categories = [ "Game" ];
    terminal = false;
  };
}