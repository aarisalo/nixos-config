{ config, pkgs, ... }:

{
  imports = [
    ./ark
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