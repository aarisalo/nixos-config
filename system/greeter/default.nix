{ config, pkgs, ... }:

{
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "--user akseli --session niri";
  };
}