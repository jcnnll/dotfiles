return {
    'rose-pine/neovim',
    lazy = false,
    name = 'rose-pine',
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            palette = {
                -- Override the builtin palette per variant
                moon = {
                    gold = '#f7cb8d',
                },
            },
            highlight_groups = {
                TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
                TelescopeNormal = { bg = 'none' },
                TelescopePromptNormal = { bg = 'none' },
                TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
                TelescopeSelection = { fg = 'text', bg = 'none' },
                TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
                TreesitterContext = { bg = '#232136' },
            },
        })
        vim.cmd('colorscheme rose-pine-moon')
    end,
}
