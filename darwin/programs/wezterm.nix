{ username, ... }:

{
  # Later:
  # homebrew.casks = [ "wezterm@nightly" ];
  # home-manager.users.${username} = { ... }: {
  #   xdg.configFile."wezterm".source = ../../wezterm/.config/wezterm;
  # };
}
