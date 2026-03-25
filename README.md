# Dotfiles

A modern, version-controlled dotfiles repository for reproducible Linux workstation setup.

## About

This repository manages personal configuration for:

- Bash
- Vim
- Emacs
- i3

The goal is to keep configuration **portable**, **reviewable**, and **easy to debug** across machines.

## Standards

This project follows current configuration and scripting best practices:

- Prefer maintained platform versions (Debian 12+, Ubuntu 22.04+, Fedora/RHEL current supported releases).
- Keep changes atomic and commit them with clear messages.
- Use documented defaults and avoid hidden side effects.
- For shell scripts, use strict mode (`set -euo pipefail`) and lint with `shellcheck`.
- Prefer XDG-compatible paths when possible.

## Repository Layout

Place dotfiles and supporting scripts using a predictable structure, for example:

```text
.
├── bash/
├── vim/
├── emacs/
├── i3/
└── scripts/
```

## Installation

1. Clone the repository.

   ```bash
   git clone <repo-url> "$HOME/dotfiles"
   cd "$HOME/dotfiles"
   ```

2. Back up existing configuration before applying new files.

   ```bash
   mkdir -p "$HOME/.config-backup"
   ```

3. Link files incrementally to simplify debugging.

   ```bash
   # Example only — adapt to your actual file layout
   ln -sfn "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
   ```

## Debugging and Validation

Use these checks after updates:

```bash
# Shell script quality
shellcheck scripts/*.sh

# Validate symlinks
find "$HOME" -maxdepth 2 -type l -lname '*dotfiles*'

# Confirm git working tree state
git status --short
```

## Contributing

1. Open an issue for major changes.
2. Keep pull requests scoped and testable.
3. Include rationale and validation steps in every PR.

## License

MIT License.
