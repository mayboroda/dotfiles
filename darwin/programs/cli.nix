{ pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
    };

    # System-wide essentials only. Personal CLI tools should move to Home Manager later.
    systemPackages = with pkgs; [
      git
      vim
      curl
    ];
  };
}
