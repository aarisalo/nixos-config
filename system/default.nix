{ config, pkgs, ... }:

{
  imports = [
    ./ark
    ./btop
    ./crossmacro
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