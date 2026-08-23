{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [ zulu25 ];
    })
  ];
}