# dtect the opserating system and pakage manager
detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macos"
    PKG_MGR="brew"
    if ! command -v brew &> /dev/null; then
      print_error "homebrew is not instaled. pls install it first."
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="linux"
    if command -v apt-get &> /dev/null; then
      PKG_MGR="apt"
      export DEBIAN_FRONTEND=noninteractive
    elif command -v pacman &> /dev/null; then
      PKG_MGR="pacman"
    else
      print_error "unsuported linux distro. only apt and pacman work for now"
      exit 1
    fi
  else
    print_error "unsuported os: $OSTYPE"
    exit 1
  fi
}
