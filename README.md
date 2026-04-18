# Coding CLI Tools Installer

This repo provides a highly modular one-liner script to install common CLI tools useful for coding and LLM-assisted development. It supports macOS (via brew), Ubuntu/Debian (via apt), and Arch Linux (via pacman).

These are **convenience tools** provided as-is.

## One-Liner Instalation

Run the following comnd in your terminal to instll the tools:

```bash
curl -fsSL https://raw.githubusercontent.com/andrijdavid/coding-cli-tools/main/install.sh | bash
```

## Tools Incuded

- **coreutils** (grep, cat, find, awk)
- **jq** and **yq** (JSON/YAML manipualtion)
- **bat** (better cat)
- **git** and **gh** (GitHub CLI)
- **git-delta** and **difftastic** (better diffs)
- **ast-grep** (structural search/replace)
- **shellcheck** (bash linting)
- **watchexec** (run comands on file changes)
- **comby** (structural code search/replace)

## Structure

- `src/`: Modualr source code for the installer.
- `scripts/build.sh`: Combines `src/` files into `install.sh`.
