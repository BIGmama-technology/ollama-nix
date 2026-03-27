{
  description = "VM to run ollama and tailscale";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    disko,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    unstablePkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    unstableOverlay = final: prev: {
      opencode = unstablePkgs.opencode;
    };

    commonModules = [
      {
        nixpkgs.overlays = [unstableOverlay];
        nixpkgs.config.allowUnfree = true; # Required for NVIDIA drivers
      }
    ];
  in {
    nixosConfigurations = {
      ollama = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit system;
        };
        modules =
          commonModules
          ++ [
            disko.nixosModules.disko
            ./disk-config.nix
            ./hardware-configuration.nix
            ./configuration.nix
          ];
      };
    };
  };
}
