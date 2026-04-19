install_ast_grep() {
  print_step "instaling ast-grep"
  if [ "$PKG_MGR" = "apt" ] || [ "$PKG_MGR" = "pacman" ]; then
    # binari fetch for linux
    local V="0.42.1"
    local TAR="ast-grep-x86_64-unknown-linux-gnu.tar.gz"
    curl -fsSL "https://github.com/ast-grep/ast-grep/releases/download/${V}/${TAR}" -o "$TMP_DIR/$TAR"
    tar -xzf "$TMP_DIR/$TAR" -C "$TMP_DIR"
    sudo mv "$TMP_DIR/sg" /usr/local/bin/sg || true
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install ast-grep
  fi
  print_success "ast-grep instaled"
}
