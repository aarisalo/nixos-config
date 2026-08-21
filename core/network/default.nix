{ config, pkgs, ... }:

{
  networking.hostName = "nixpc";
  networking.networkmanager = {
    enable = true;
    settings = {
      main = {
        dns = "dnsmasq";
      };
    };
  };

  services.dnsmasq = {
    enable = true;
    settings = {
      listen-address = "127.0.0.1";
      no-resolv = true;
      port = "0";
      server = [ 
        "1.1.1.1"
        "8.8.8.8" 
        "8.8.4.4" 
      ];
    };
  };
}