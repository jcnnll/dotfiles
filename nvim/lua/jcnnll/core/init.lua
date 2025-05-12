require("jcnnll.core.options")
require("jcnnll.core.keymaps")

-- Strip whitespace from files on write
vim.api.nvim_create_autocmd("BufwritePre", {
    group = vim.api.nvim_create_augroup("strip-space", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- File types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit" },
    callback = function(ev)
        vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function(ev)
        vim.api.nvim_set_option_value("textwidth", 0, { scope = "local" })
        vim.api.nvim_set_option_value("wrapmargin", 0, { scope = "local" })
        vim.api.nvim_set_option_value("linebreak", true, { scope = "local" })
    end,
})
