{ config, pkgs, ... }:

{
  imports = [
    ./greeter
    ./java
    ./lact
    ./niri
    ./piper
    ./prism
    ./steam
    ./variables
    ./xwayland
  ];
}