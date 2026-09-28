{ ... }:
{
  # Keep Homebrew available; package lists will move here in later phases.
  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    brews = [
      "brew-cask-completion"
      "docker-credential-helper"
      "pinentry-mac"
      "socket_vmnet"
      "terminal-notifier"
    ];
    casks = [
      "aerospace"
      "basictex"
      "bitwarden"
      "chromium"
      "claude-code"
      "codex"
      "emacs-app"
      "espanso"
      "font-jetbrains-mono"
      "glide-browser"
      "google-drive"
      "jetbrains-toolbox"
      "neovide-app"
      "openscad"
      "racket"
      "rancher"
      "todoist-app"
      "wezterm@nightly"
      "zettlr"
    ];
  };
}
