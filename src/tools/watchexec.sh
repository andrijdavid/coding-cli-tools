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
