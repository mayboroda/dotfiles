# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/zsh/{path,zsh_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
# Remove local variable `file` after the loop
unset file;

# Case-insensitive globbing (used in pathname expansion)   
setopt nocaseglob;

