return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
  },
  keys = {
    { "-", ":Oil<CR>", desc = "Open parent directory" },
  },
}
