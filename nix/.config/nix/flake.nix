{
  description = "MacOS setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }:
  let
      user = "dmytromay";
      system = "aarch64-darwin";
  in {
      #   error: flake 'git+file:///Users/dmytromay/dotfiles?dir=nix/.config/nix' does not provide attribute 'packages.aarch64-darwin.default' or 'defaultPackage.aarch64-darwin'
    darwinConfigurations.wix = darwin.lib.darwinSystem {
      inherit system;

      modules = [
        # Let nix-darwin manage the system and enable flakes
        ({ pkgs, ... }: {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];

          programs.zsh.enable = true;           # manage zsh
          services.nix-daemon.enable = true;    # ensure daemon is on

          # A sample macOS default (show all filename extensions in Finder)
          system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
        })

        # Home Manager as a nix-darwin module
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Your user configuration
          home-manager.users."${user}" = { pkgs, ... }: {
            home.stateVersion = "25.05";
            # 
            home.homeDirectory = "/Users/dmytromay";
            # CLI tools you want
            home.packages = with pkgs; [
              jq
              curl
              ripgrep
              fd
            ];
          };
        }
      ];
    };
  };
}
