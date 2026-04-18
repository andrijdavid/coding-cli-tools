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
