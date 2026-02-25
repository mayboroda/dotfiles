{ config, pkgs, home-manager, ... }:

{
  imports = [
    home-manager.darwinModules.home-manager
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.dmytromay = {config, pkgs, ...}: {

    home.username = "dmytromay";
    home.homeDirectory = "/Users/dmytromay";
    home.stateVersion = "25.11";

    programs.zsh = {
      enable = true;
      initExtra = ''
      # Setup brew
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # Load the shell dotfiles, and then some:
      # * ~/.path can be used to extend `$PATH`.
      # * ~/.extra can be used for other settings you don’t want to commit.
      for file in ~/.config/zsh/{path,zsh_prompt,aliases,functions,exports,extra,thelast}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
      done
      # Remove local variable `file` after the loop
      unset file

      # Case-insensitive globbing (used in pathname expansion)
      setopt nocaseglob
      '';
    };

    xdg.configFile."zsh/aliases".source = ../zsh/.config/zsh/aliases;
    xdg.configFile."zsh/exports".source = ../zsh/.config/zsh/exports;
    xdg.configFile."zsh/path".source = ../zsh/.config/zsh/path;
    xdg.configFile."zsh/zsh_prompt".source = ../zsh/.config/zsh/_zsh_prompt;
    xdg.configFile."zsh/thelast".source = ../zsh/.config/zsh/thelast;
  };
}
