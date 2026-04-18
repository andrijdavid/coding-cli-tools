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
