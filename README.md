# 🛠 Dotfiles

Personal configuration for a streamlined and consistent development environment.

This repository includes custom configuration for:

- 🖥 [Kitty](https://sw.kovidgoyal.net/kitty/)
- 🧠 [Neovim](https://neovim.io/)
- 🌟 [Starship](https://starship.rs/)
- 📟 [Tmux](https://github.com/tmux/tmux)
- 🐚 Zsh (`.zshrc`)
- 📁 Tmux session starter script

## 🔧 Installation

```sh
git clone https://github.com/jcnnll/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install
```

The script will symlink configuration files from the repo to their proper
locations in your system (e.g., ~/.config/nvim, ~/.config/kitty, etc.).

## 📂 What's Inside

### Kitty

Custom terminal settings for performance, aesthetics, and ergonomics.

### Neovim

Lua-based configuration leveraging LazyVim.

### Starship

Blazing-fast, minimal, and customizable prompt with a clean theme.

### Tmux

Optimized configuration with sensible keybindings and visual enhancements.
I use a bash script executable session launcher in `scripts/t` .

### Zsh

`.zshrc` with prompt setup, aliases, and shell behavior tweaks.

## 🗒 Notes

- **Dependencies:**
  Ensure the following are installed:
  `neovim`, `tmux`, `zsh`, `starship`, `fzf`, `ripgrep`, `fd`

- This setup specifically supports the tools and config I use on a MacOS system.

## 🎯 Neovim Key Mappings

Refer to the [LazyVim key maps](https://www.lazyvim.org/keymaps)
