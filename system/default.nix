{ config, pkgs, ... }:

{
  imports = [
    ./ark
    ./btop
    ./greeter
    ./lact
    ./lutris
    ./niri
    ./piper
    ./prism
    ./r2modman
    ./steam
    ./variables
    ./xwayland
  ];
}