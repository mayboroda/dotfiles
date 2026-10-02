# Local/private/work-specific zsh config.
# This file is intentionally not managed by Nix for now.

# Homebrew, if still needed for non-Nix tools.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Rancher Desktop
if [[ -d "$HOME/.rd/bin" ]]; then
  export PATH="$HOME/.rd/bin:$PATH"
fi

# Bazel
[[ -r "$HOME/.bazelenv" ]] && source "$HOME/.bazelenv"

alias fix-bazel='pbpaste | grep "^buildozer" | bash'
alias copy-mysql-port='docker ps --format=json --filter="expose=3306" --filter="label=org.testcontainers=true" --format="{{.Ports}}" | grep -o "[0-9]*->[0-9]*/tcp" | head -n1 | cut -d "-" -f1 | pbcopy'

# Experimental / personal
alias n="nvim -c ':cd %:~'"
alias nn="NVIM_APPNAME=nvim_0_12 nvim"

alias notes="cd $NOTES_DIR"
alias sicp="cd /Users/dmytromay/src/mayboroda/sicp"
alias mayboroda="cd /Users/dmytromay/src/mayboroda/"

alias src="cd ~/src"
alias wix="cd ~/src/wix/"
alias devex="cd ~/src/wix/wix-ci"

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# Rust
[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Odin
export ODIN_ROOT="$HOME/libs/odin-macos-arm64-nightly+2026-06-08"
export PATH="$PATH:$ODIN_ROOT"

# Coursier / Scala
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

# JavaFX
export JAVAFX_HOME="$HOME/libs/jfx/javafx-sdk-21.0.7"
export JAVAFX_LIB="$JAVAFX_HOME/lib"

# NVM lazy loading
export NVM_DIR="$HOME/.nvm"

lazy_load_nvm() {
  unset -f nvm node npm npx
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
}

nvm()  { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm()  { lazy_load_nvm; npm "$@"; }
npx()  { lazy_load_nvm; npx "$@"; }

# Pi profiles
wpi() {
  nvm use v24.14.0
  PI_CODING_AGENT_DIR="$HOME/.pi-wix" command pi "$@"
}

ppi() {
  nvm use v24.14.0
  PI_CODING_AGENT_DIR="$HOME/.pi-personal" command pi "$@"
}
