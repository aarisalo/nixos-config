{ config, pkgs, ... }:

{
  imports = [
    ./appimage
    ./ark
    ./artix-games-launcher
    ./btop
    ./bubblewrap
    ./crossmacro
    ./deadlock-mod
    ./exiled-exchange-2
    ./gamescope
    ./greeter
    ./hyperline
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
    ./wl-clipboard
    ./xwayland
  ];
}