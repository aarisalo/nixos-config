{ config, pkgs, ... }:

{
  networking.hostName = "nixpc";
  networking.networkmanager = {
    enable = true;
    settings = {
      main = {
        dns = "systemd-resolved";
      };
    };
  };

  services.resolved.enable = true;
}
