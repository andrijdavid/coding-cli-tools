# main exection loop
main() {
  print_step "starting instalation of cli tools"
  detect_os
  
  if [ "$PKG_MGR" = "apt" ]; then
    print_step "updating apt chache"
    sudo apt-get update -yqq
  elif [ "$PKG_MGR" = "pacman" ]; then
    print_step "syncing pacman databases"
    sudo pacman -Sy --noconfirm
  fi

  # call all instalers
  install_coreutils
  install_jq
  install_yq
  install_bat
  install_git
  install_gh
  install_git_delta
  install_difftastic
  install_ast_grep
  install_shellcheck
  install_watchexec
  install_comby

  print_step "all tools instaled corectly!"
}

main "$@"
