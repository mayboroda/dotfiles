{
  config,
  pkgs,
  home-manager,
  ...
}:

{
  imports = [
    home-manager.darwinModules.home-manager
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.dmytromay =
    { config, pkgs, ... }:
    {

      home.username = "dmytromay";
      home.homeDirectory = "/Users/dmytromay";
      home.stateVersion = "26.11";

      programs.mise = {
        enable = true;
      };

      programs.zsh = {
        enable = false;
      };
    };
}
