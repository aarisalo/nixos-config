{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lact
  ];
  
  services.lact.enable = true;
}