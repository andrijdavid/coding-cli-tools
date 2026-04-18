# UI funcitons for nice outpust
print_step() {
  echo -e "\n\033[1;34m==>\033[0m \033[1m$1\033[0m"
}

print_success() {
  echo -e "  \033[1;32m✔\033[0m $1"
}

print_error() {
  echo -e "  \033[1;31m✖\033[0m $1"
}
