install_comby() {
  print_step "instaling comby"
  if [ "$PKG_MGR" = "apt" ] || [ "$PKG_MGR" = "pacman" ]; then
    bash -c "$(curl -sL get.comby.dev)" || true
  elif [ "$PKG_MGR" = "brew" ]; then
    brew install comby
  fi
  print_success "comby instaled"
}
