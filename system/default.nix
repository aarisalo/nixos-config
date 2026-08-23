{ config, pkgs, ... }:

{
  imports = [
    ./ark
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