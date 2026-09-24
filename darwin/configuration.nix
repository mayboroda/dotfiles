{ ... }:
let
  username = "dmytromay";
in
{
  imports = [
    ./system.nix
    ./homebrew.nix
    ./programs/cli.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/nvim.nix
    ./programs/wezterm.nix
    ./programs/mise.nix
    ./programs/direnv.nix
  ];

  # Required
  system.stateVersion = 4;
  system.primaryUser = username;
  users.users.${username} = {
    home = "/Users/${username}";
  };

  # Verify the actual GID
  # dscl . -read /Groups/nixbld PrimaryGroupID
  ids.gids.nixbld = 350;

  # Allow unfree packages (needed later for some tools)
  nixpkgs.config.allowUnfree = true;

  # Required for flake builds
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
