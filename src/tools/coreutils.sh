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
