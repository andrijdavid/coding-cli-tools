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
