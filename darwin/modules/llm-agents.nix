{ inputs, pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = [
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];
}
