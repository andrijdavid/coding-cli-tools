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
