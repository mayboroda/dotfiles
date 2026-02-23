{ config, pkgs, ... }:

{
  # Required
  system.stateVersion = 4;

  # Allow unfree packages (needed later for some tools)
  nixpkgs.config.allowUnfree = true;

  # Basic system packages (safe test set)
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
  ];

  # Enable Zsh integration
  programs.zsh.enable = true;

  # Example macOS defaults test (visible change)
  system.defaults.dock.autohide = true;

  # Enable Homebrew (empty for now)
  homebrew.enable = true;

  # Required for flake builds
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
