return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "frappe",
            reansparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
