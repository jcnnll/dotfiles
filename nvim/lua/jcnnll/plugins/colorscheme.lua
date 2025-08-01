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
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
-- }
return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            varient = "dawn",
            styles = {
                transparency = true,
            },
        })
        vim.cmd.colorscheme("rose-pine")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
