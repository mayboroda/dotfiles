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
      ammonite # Homebrew: ammonite-repl
      asciidoctor
      asdf
      autoconf-archive
      automake
      bash
      bat
      bazelisk
      ccache
      chafa
      clang-tools # Homebrew: clang-format
      cmake
      colordiff
      coreutils
      docker
      fd
      ffmpeg
      fzf
      gawk
      gh
      ghc
      git-lfs
      gnused # Homebrew: gnu-sed
      grpcurl
      helix
      himalaya
      htop
      jid
      jiratui
      jq
      kubectx
      languagetool
      leiningen
      llvm
      lua-language-server
      luarocks
      marksman
      mill
      mariadb.client
      nasm
      ninja
      nmap
      pandoc
      pass
      pkgconf
      python3Packages.pyqt6 # Homebrew: pyqt
      qt6.qtbase # Homebrew: qt
      ripgrep
      rustup
      shellcheck
      stow
      taskwarrior3 # Homebrew: task
      inetutils # Provides telnet
      terraform
      timewarrior
      tmux
      watch
      python3Packages.weasyprint # Homebrew: weasyprint
      wget
      yq
      yt-dlp
      zig
      zk
      zola
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  };
}
