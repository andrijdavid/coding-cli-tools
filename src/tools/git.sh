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
