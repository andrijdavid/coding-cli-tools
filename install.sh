#!/usr/bin/env bash
# auto genreted file, do not edit directly

#!/usr/bin/env bash
# setp stric mod
set -euo pipefail

# gloabal vars
OS_TYPE=""
PKG_MGR=""
TMP_DIR=$(mktemp -d)

# clenup trap
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT
# UI funcitons for nice outpust
print_step() {
  echo -e "\n\033[1;34m==>\033[0m \033[1m$1\033[0m"
}

print_success() {
  echo -e "  \033[1;32m✔\033[0m $1"
}

print_error() {
  echo -e "  \033[1;31m✖\033[0m $1"
}
# dtect the opserating system and pakage manager
detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macos"
    PKG_MGR="brew"
    if ! command -v brew &> /dev/null; then
      print_error "homebrew is not instaled. pls install it first."
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="linux"
    if command -v apt-get &> /dev/null; then
      PKG_MGR="apt"
      export DEBIAN_FRONTEND=noninteractive
    elif command -v pacman &> /dev/null; then
      PKG_MGR="pacman"
    else
      print_error "unsuported linux distro. only apt and pacman work for now"
      exit 1
    fi
  else
    print_error "unsuported os: $OSTYPE"
    exit 1
  fi
}
install_ast_grep() {
  print_step "instaling ast-grep"
  if [ "$PKG_MGR" = "apt" ] || [ "$PKG_MGR" = "pacman" ]; then
    # binari fetch for linux
    local V="0.25.1"
    local TAR="ast-grep-x86_64-unknown-linux-gnu.tar.gz"
    curl -fsSL "https://github.com/ast-grep/ast-grep/releases/download/${V}/${TAR}" -o "$TMP_DIR/$TAR"
    tar -xzf "$TMP_DIR/$TAR" -C "$TMP_DIR"
    sudo mv "$TMP_DIR/sg" /usr/local/bin/sg || true
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install ast-grep
  fi
  print_success "ast-grep instaled"
}
install_bat() {
  print_step "instaling bat"
  if [ "$PKG_MGR" = "apt" ]; then
    sudo apt-get install -yqq bat
    if [ ! -f /usr/local/bin/bat ] && [ -f /usr/bin/batcat ]; then
      sudo ln -s /usr/bin/batcat /usr/local/bin/bat
    fi
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm bat
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install bat
  fi
  print_success "bat instaled"
}
install_comby() {
  print_step "instaling comby"
  if [ "$PKG_MGR" = "apt" ] || [ "$PKG_MGR" = "pacman" ]; then
    bash -c "$(curl -sL get.comby.dev)" || true
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install comby
  fi
  print_success "comby instaled"
}
install_coreutils() {
  print_step "instaling coreutils (grep, cat, find, awk)"
  if [ "$PKG_MGR" = "apt" ]; then
    sudo apt-get install -yqq grep coreutils findutils gawk
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm grep coreutils findutils gawk
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install grep coreutils findutils gawk
  fi
  print_success "coreutils instaled"
}
install_difftastic() {
  print_step "instaling difftastic"
  if [ "$PKG_MGR" = "apt" ]; then
    local V="0.58.0"
    local TAR="difft-x86_64-unknown-linux-gnu.tar.gz"
    curl -fsSL "https://github.com/Wilfred/difftastic/releases/download/${V}/${TAR}" -o "$TMP_DIR/$TAR"
    tar -xzf "$TMP_DIR/$TAR" -C "$TMP_DIR"
    sudo mv "$TMP_DIR/difft" /usr/local/bin/
    sudo chmod +x /usr/local/bin/difft
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm difftastic
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install difftastic
  fi
  print_success "difftastic instaled"
}
install_gh() {
  print_step "instaling gh (github cli)"
  if [ "$PKG_MGR" = "apt" ]; then
    type -p curl >/dev/null || (sudo apt-get update -yqq && sudo apt-get install curl -yqq)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-get update -yqq
    sudo apt-get install gh -yqq
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm github-cli
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install gh
  fi
  print_success "gh instaled"
}
install_git_delta() {
  print_step "instaling git-delta"
  if [ "$PKG_MGR" = "apt" ]; then
    local V="0.17.0"
    local DEB="git-delta_${V}_amd64.deb"
    curl -fsSL "https://github.com/dandavison/delta/releases/download/${V}/${DEB}" -o "$TMP_DIR/$DEB"
    sudo dpkg -i "$TMP_DIR/$DEB" || sudo apt-get install -f -yqq
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm git-delta
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install git-delta
  fi
  print_success "git-delta instaled"
}
install_git() {
  print_step "instaling git"
  if [ "$PKG_MGR" = "apt" ]; then
    sudo apt-get install -yqq git
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm git
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install git
  fi
  print_success "git instaled"
}
install_jq() {
  print_step "instaling jq"
  if [ "$PKG_MGR" = "apt" ]; then
    sudo apt-get install -yqq jq
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm jq
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install jq
  fi
  print_success "jq instaled"
}
install_shellcheck() {
  print_step "instaling shellcheck"
  if [ "$PKG_MGR" = "apt" ]; then
    sudo apt-get install -yqq shellcheck
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm shellcheck
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install shellcheck
  fi
  print_success "shellcheck instaled"
}
install_watchexec() {
  print_step "instaling watchexec"
  if [ "$PKG_MGR" = "apt" ]; then
    local V="2.1.2"
    local TAR="watchexec-${V}-x86_64-unknown-linux-musl.tar.xz"
    curl -fsSL "https://github.com/watchexec/watchexec/releases/download/v${V}/${TAR}" -o "$TMP_DIR/$TAR"
    tar -xf "$TMP_DIR/$TAR" -C "$TMP_DIR"
    sudo mv "$TMP_DIR/watchexec-${V}-x86_64-unknown-linux-musl/watchexec" /usr/local/bin/
    sudo chmod +x /usr/local/bin/watchexec
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm watchexec
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install watchexec
  fi
  print_success "watchexec instaled"
}
install_yq() {
  print_step "instaling yq"
  if [ "$PKG_MGR" = "apt" ]; then
    local V="v4.44.1"
    sudo curl -fsSL "https://github.com/mikefarah/yq/releases/download/${V}/yq_linux_amd64" -o /usr/local/bin/yq
    sudo chmod +x /usr/local/bin/yq
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm yq
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install yq
  fi
  print_success "yq instaled"
}
# main exection loop
main() {
  print_step "starting instalation of cli tools"
  detect_os
  
  if [ "$PKG_MGR" = "apt" ]; then
    print_step "updating apt chache"
    sudo apt-get update -yqq
  elif [ "$PKG_MGR" = "pacman" ]; then
    print_step "syncing pacman databases"
    sudo pacman -Sy --noconfirm
  fi

  # call all instalers
  install_coreutils
  install_jq
  install_yq
  install_bat
  install_git
  install_gh
  install_git_delta
  install_difftastic
  install_ast_grep
  install_shellcheck
  install_watchexec
  install_comby

  print_step "all tools instaled corectly!"
}

main "$@"
