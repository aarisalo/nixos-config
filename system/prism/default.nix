{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [ zulu25 ];
    })
    pkgs.p7zip
  ];
}