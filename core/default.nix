{ config, pkgs, ... }:

{
  imports = [
    ./audio
    ./bluetooth
    ./boot
    ./devices
    ./filesystem
    ./graphics
    ./network
    ./nix
    ./security
  ];
}