return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    style = "storm",
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.bg_statusline = colors.none
    end,
  },
}
