{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "ls -1a --color=auto -F";
    };
  };
}