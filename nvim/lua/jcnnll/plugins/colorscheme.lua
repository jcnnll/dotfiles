-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "frappe",
--             transparent_background = true,
--         })
--         vim.cmd.colorscheme("catppuccin")
--     end,
-- }
-- return {
--     "shaunsingh/nord.nvim",
--     name = "nord",
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme("nord")
--     end,
-- }
return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            varient = "moon",
        })
        vim.cmd.colorscheme("rose-pine")
    end,
}
