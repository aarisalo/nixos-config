{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.deadlock-mod-manager.packages.${pkgs.stdenv.hostPlatform.system}.nightly
  ];

  nix.settings = {
    substituters = [
      "https://deadlock-mod-manager.cachix.org"
    ];

    trusted-public-keys = [
      "deadlock-mod-manager.cachix.org-1:wUjtzL6yN2i9zTq1YrXHBr0mx3LP7tBGsosk3N+/A/M="
    ];
  };
}