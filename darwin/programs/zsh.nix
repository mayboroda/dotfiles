{ ... }:

{
  # nix-darwin system shell integration.
  programs.zsh.enable = true;

  # Home Manager zsh config will be enabled in the shell migration phase.
  home-manager.users.dmytromay = { ... }: {
    programs.zsh.enable = false;
  };
}
