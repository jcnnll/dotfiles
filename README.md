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

## 🎯 Neovim Key Mappings

The following table lists all the custom keybindings configured for Neovim.

| Keybinding        | Mode   | Description                               |
|-------------------|--------|-------------------------------------------|
| `<leader>sh`      | Normal | [S]earch [H]elp                           |
| `<leader>sk`      | Normal | [S]earch [K]eymaps                        |
| `<leader>sf`      | Normal | [S]earch [F]iles                          |
| `<leader>sw`      | Normal | [S]earch current [W]ord                   |
| `<leader>sg`      | Normal | [S]earch by [G]rep                        |
| `<leader>sd`      | Normal | [S]earch [D]iagnostics                    |
| `<leader>sr`      | Normal | [S]earch [R]esume                         |
| `<leader>s.`      | Normal | [S]earch Recent Files                     |
| `<leader>/`       | Normal | [/] Fuzzily search in current buffer      |
| `<leader>s/`      | Normal | [S]earch [/] in Open Files                |
| `\`               | Normal | Open parent directory                     |
| `K`               | Normal | Hover (LSP)                               |
| `gd`              | Normal | Go to definition (LSP)                    |
| `gD`              | Normal | Go to declaration (LSP)                   |
| `gi`              | Normal | Go to implementation (LSP)               |
| `go`              | Normal | Go to type definition (LSP)              |
| `gr`              | Normal | Go to references (LSP)                   |
| `gs`              | Normal | Signature help (LSP)                     |
| `gl`              | Normal | Show diagnostics float                   |
| `<F2>`            | Normal | Rename (LSP)                              |
| `<F3>`            | Normal | Format code (LSP)                         |
| `<F4>`            | Normal | Code action (LSP)                         |
| `<leader>p`       | Normal | [P]repend to harpoon file list           |
| `<leader>a`       | Normal | [A]ppend to harpoon file list            |
| `<leader>h`       | Normal | [H]arpoon file list                       |
| `<leader>1`       | Normal | Harpoon file [1]                         |
| `<leader>2`       | Normal | Harpoon file [2]                         |
| `<leader>3`       | Normal | Harpoon file [3]                         |
| `<leader>4`       | Normal | Harpoon file [4]                         |
| `<leader>r1`      | Normal | Harpoon [r]eplace file [1]              |
| `<leader>r2`      | Normal | Harpoon [r]eplace file [2]              |
| `<leader>r3`      | Normal | Harpoon [r]eplace file [3]              |
| `<leader>r4`      | Normal | Harpoon [r]eplace file [4]              |
| `<C-n>`           | Insert | Select next item (completion)            |
| `<C-p>`           | Insert | Select previous item (completion)        |
| `<C-b>`           | Insert | Scroll docs up                           |
| `<C-f>`           | Insert | Scroll docs down                         |
| `<CR>`            | Insert | Confirm completion                       |
| `<Tab>`           | Insert | Select next item                         |
| `<S-Tab>`         | Insert | Select previous item                     |
| `<C-Space>`       | Insert | Trigger completion menu                  |
| `<C-l>`           | Insert | Expand or jump (luasnip)                 |
| `<C-h>`           | Insert | Jump backward (luasnip)                  |
| `<leader>f`       | Normal | [F]ormat buffer                          |
| `<C-h>`           | Normal | Move focus to the left window            |
| `<C-l>`           | Normal | Move focus to the right window           |
| `<C-j>`           | Normal | Move focus to the lower window           |
| `<C-k>`           | Normal | Move focus to the upper window           |
| `|`               | Normal | Vertical split window                    |
| `<leader>x`       | Normal | Close current window                     |
