{
  description = "Mayboroda macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      # Follow corresponding `release` branch from Home Manager
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      home-manager,
      ...
    }:
    let
      hostname = "mayb";
    in
    {
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs;
          home-manager = inputs.home-manager;
          username = "dmytromay";
          homeDirectory = "/Users/dmytromay";
        };
        modules = [
          ./darwin/configuration.nix
          ./darwin/home-manager.nix
        ];
      };
    };
}
