{ username, homeDirectory, ... }:

{
  # nix-darwin system shell integration.
  programs.zsh.enable = true;

  # Nix-managed prompt file.
  environment.etc."zsh/prompt.zsh".source = ../../zsh/.config/zsh/_zsh_prompt;

  home-manager.users.${username} = { ... }: {
    programs.zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "~" = "cd ~";
        "-" = "cd -";

        d = "cd ~/Downloads";
        dt = "cd ~/Desktop";
        p = "cd ~/projects";
        tmp = "cd ~/tmp";
        dots = "cd ~/dotfiles";
        edots = "nvim ~/dotfiles";

        ls = "ls -G";
        ll = "ls -lG";
        la = "ls -lGah";
        lsd = "ls -ldG */";

        rm = "rm -i";
        cp = "cp -i";
        grep = "rg --color=auto";
        rg = "rg --color=auto";

        g = "git";
      };

      sessionVariables = {
        NIX_IS_ON = "1";

        EDITOR = "nvim";
        VISUAL = "nvim";
        MANPAGER = "nvim +Man!";

        NOTES_DIR = "${homeDirectory}/notes";
        ZK_NOTEBOOK_DIR = "${homeDirectory}/notes";
      };

      initContent = ''
        setopt nocaseglob

        # source /etc/zsh/prompt.zsh

        # Local/private/work-specific shell config.
        [[ -r "$HOME/.config/zsh/local.zsh" ]] && source "$HOME/.config/zsh/local.zsh"
      '';
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    home.sessionPath = [
      "${homeDirectory}/bin"
      "${homeDirectory}/.local/bin"
    ];
  };
}
