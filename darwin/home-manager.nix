{
  home-manager,
  username,
  homeDirectory,
  ...
}:

{
  imports = [
    home-manager.darwinModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = { ... }: {
    home.username = "${username}";
    home.homeDirectory = "${homeDirectory}";
    home.stateVersion = "26.11";
  };
}
