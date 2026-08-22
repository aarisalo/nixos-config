{ config, pkgs, ... }:

{
  imports = [
    ./greeter
    ./lact
    ./niri
    ./piper
    ./prism
    ./steam
    ./variables
    ./xwayland
  ];
}