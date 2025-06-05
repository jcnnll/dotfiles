# 🛠 Dotfiles

Personal configuration for a streamlined and consistent development environment.

This repository includes custom configuration for:

- 🖥 [Kitty](https://sw.kovidgoyal.net/kitty/)
- 🧠 [Neovim](https://neovim.io/)
- 🌟 [Starship](https://starship.rs/)
- 📟 [tmux](https://github.com/tmux/tmux)
- 🐚 Zsh (`.zshrc`)
- 📁 Session management with [sesh](https://github.com/jcnnll/sesh)


## 🔧 Installation

To set up your environment, clone the repo and run the `./install` script:

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
Lua-based configuration with sensible defaults, plugin management, and custom keymaps.

### Starship
Blazing-fast, minimal, and customizable prompt with a clean theme.

### tmux
Optimized configuration with sensible keybindings and visual enhancements.
Previous session launcher in `scripts/t` is deprecated in favor of [sesh](https://github.com/jcnnll/sesh).

### Zsh
`.zshrc` with prompt setup, aliases, and shell behavior tweaks.


## 🧩 Session Management

Session handling is now powered by [sesh](https://github.com/jcnnll/sesh).
After installation, use `sesh` to manage and launch terminal sessions.


## 🗒 Notes

- **Dependencies:**
  Ensure the following are installed:
  `neovim`, `tmux`, `zsh`, `starship`, `fzf`, `ripgrep`, `fd`

- This setup assumes you use a Unix-like system with support for symlinks and typical config paths.

