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
