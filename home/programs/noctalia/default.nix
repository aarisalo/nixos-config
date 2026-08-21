{ config, pkgs, ... }:

{
  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        font = "JetBrainsMono Nerd Font";
        setup_wizard_enabled = false;
        telemetry_enabled = false;
      };
    };
  };
}