{ home-manager, ... }:

{
  imports = [
    home-manager.darwinModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.dmytromay = { ... }: {
    home.username = "dmytromay";
    home.homeDirectory = "/Users/dmytromay";
    home.stateVersion = "26.11";
  };
}
