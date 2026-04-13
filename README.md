# Dotfiles

This repo contains configuration files only. Each directory represents a "package". Stow mirrors the internal structure of these packages onto the target directory.

## Dependencies

- GNU Stow
- Shell zsh

## Installation

Ensure Stow is installed, clone the repo to `~/dotfiles` and run the following:

```bash
cd ~/dotfiles
stow zsh tmux starship nvim kitty
```

