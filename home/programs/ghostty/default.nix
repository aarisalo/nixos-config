{ config, pkgs, ... }:

{
  programs.ghostty.enable = true;

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "com.mitchellg.ghostty.desktop" ];
    };
  };
  xdg.configFile."ghostty/config.ghostty".source = ../../config/config.ghostty;
}