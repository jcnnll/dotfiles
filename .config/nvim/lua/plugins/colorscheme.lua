return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin-macchiato",
      },
    },
  },
}
