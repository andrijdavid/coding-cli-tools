install_gh() {
  print_step "instaling gh (github cli)"
  if [ "$PKG_MGR" = "apt" ]; then
    type -p curl >/dev/null || (sudo apt-get update -yqq && sudo apt-get install curl -yqq)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-get update -yqq
    sudo apt-get install gh -yqq
  elif [ "$PKG_MGR" = "pacman" ]; then
    sudo pacman -S --needed --noconfirm github-cli
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install gh
  fi
  print_success "gh instaled"
}
