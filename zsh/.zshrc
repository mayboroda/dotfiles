# source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/zsh/{path,zsh_prompt,aliases,functions,exports,extra,thelast}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
# Remove local variable `file` after the loop
unset file;

# Case-insensitive globbing (used in pathname expansion)   
setopt nocaseglob;


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/dmytromay/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

source "$HOME/.bazelenv"
