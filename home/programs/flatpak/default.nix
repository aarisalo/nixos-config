{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    flatpak
  ];
  services.flatpak = {
    enable = true;
    update.auto =  {
      enable = true;
      onCalendar = "weekly";
    };
  };
}