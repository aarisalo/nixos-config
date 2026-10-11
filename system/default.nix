{ config, pkgs, ... }:

{
  imports = [
    ./appimage
    ./ark
    ./artix-games-launcher
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
    ./node
    ./pi-agent
    ./piper
    ./prism
    ./python
    ./r2modman
    ./steam
    ./variables
    ./xwayland
  ];
}