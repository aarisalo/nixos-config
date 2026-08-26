{ config, pkgs, ... }:

{
  imports = [
    ./audio
    ./bluetooth
    ./boot
    ./devices
    ./filesystem
    ./graphics
    ./hibernation
    ./network
    ./nix
    ./security
    ./swap
  ];
}