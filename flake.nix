{
  description = "Mayboroda macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin }:
  let
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations.YOUR_HOSTNAME = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ./darwin/configuration.nix
      ];
    };
  };
}
