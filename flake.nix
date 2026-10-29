{
  description = "NixOS flake for nixpc";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Pinned to the last nyxpkgs revision shipping linux_cachyos 7.2.11 — the
    # 7.3.0 bump (nyxpkgs commit 7cd9c90) causes a power draw regression.
    # Revert to `nyxpkgs-unstable` once it's fixed upstream.
    chaotic.url = "github:chaotic-cx/nyx/b853075364de850a451311abae8c9d96cdf55062"; # For CachyOS kernel

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    crossmacro = {
      url = "github:alper-han/CrossMacro";
    };

    hyperline = {
      url = "github:paralin/hyperline-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      chaotic,
      home-manager,
      noctalia,
      noctalia-greeter,
      nix-flatpak,
      spicetify-nix,
      crossmacro,
      hyperline,
      ...
    }:
    {
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/nixpc
          ./system
          chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
          noctalia.nixosModules.default
          noctalia-greeter.nixosModules.default
          crossmacro.nixosModules.default
          hyperline.nixosModules.default

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";

            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            
            home-manager.users.akseli = {

              imports = [
                nix-flatpak.homeManagerModules.nix-flatpak
                noctalia.homeModules.default
                spicetify-nix.homeManagerModules.default
                ./home
              ];
            };
          }
        ];
      };
    };
}
