{ config, pkgs, ... }:

{
  imports = [
    ./ark
    ./btop
    ./crossmacro
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