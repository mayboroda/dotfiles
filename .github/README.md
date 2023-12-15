# .dotfiles

My personal setup for .dotfiles

## Core Deps
- install homebrew
- install GPG
- install git

## New Machine
```bash
cd ~
mkdir .dotfiles
git --git-dir="$HOME/.dotfiles" --work-dir="$HOME" init
git --git-dir="$HOME/.dotfiles" remote add origin git@github.com:mayboroda/dotfiles.git
git --git-dir="$HOME/.dotfiles" pull origin main
```

## Colors
- Main color palletes is [NordTheme](https://www.nordtheme.com/)
- iTerm2 Nord pallete by [arcticicestudio](https://github.com/arcticicestudio/nord-iterm2)

## Thanks to
- The main repo that I use to copy code from [bathiasbynens](https://github.com/mathiasbynens/dotfiles)
- Another beautiful dotfile organization by [matijs](https://github.com/matijs/dotfiles) (no rsync)
- Git ignore all folders but certain one [heiblmedia gist](https://gist.github.com/hieblmedia/9318457)

