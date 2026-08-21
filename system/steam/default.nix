{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: [ pkgs.mangohud ];
    };
  };

  programs.gamemode.enable = true;
  services.resolved.enable = true;
}