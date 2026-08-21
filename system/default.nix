{ config, pkgs, ... }:

{
  imports = [
    ./greeter
    ./java
    ./lact
    ./niri
    ./piper
    ./steam
    ./variables
    ./xwayland
  ];
}