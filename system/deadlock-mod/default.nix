{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.grimoire.packages.${pkgs.system}.default
  ];

  nix.settings = {
    extra-substituters = [ "https://grimoire.cachix.org" ];
    extra-trusted-public-keys = [ "grimoire.cachix.org-1:5Y9dQ9wk9z4BsOnkv9t8ULcsnnaJ1zSMnzOd1dV5QbA=" ];
  };
}