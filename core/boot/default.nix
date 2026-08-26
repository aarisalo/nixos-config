{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
  nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  # boot.kernelPackages = pkgs.linuxpackages_latest;
}