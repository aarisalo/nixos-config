{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop-rocm
  ];
}