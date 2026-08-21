{ config, pkgs, ... }:

{
  networking.hostName = "nixpc";
  networking.networkmanager.enable = true;
}