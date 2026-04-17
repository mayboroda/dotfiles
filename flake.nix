{
  description = "Mayboroda macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      # Follow corresponding `release` branch from Home Manager
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, nix-darwin, home-manager, ...}:
    let
      system = "aarch64-darwin";
      hostname = "mayb";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { home-manager = inputs.home-manager; };
        modules = [
          ./darwin/configuration.nix
          ./darwin/home.nix
        ];
      };
    };
}
