{ config, pkgs, ... }:

{
  imports = [
    ./appimage
    ./ark
    ./btop
    ./crossmacro
    ./deadlock-mod
    ./exiled-exchange-2
    ./gamescope
    ./greeter
    ./lact
    ./llamacpp
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