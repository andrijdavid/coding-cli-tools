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
