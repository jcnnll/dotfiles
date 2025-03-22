require("jcnnll.core.options")
require("jcnnll.core.keymaps")

-- Strip whitespace from files on write
vim.api.nvim_create_autocmd("BufwritePre", {
    group = vim.api.nvim_create_augroup("jcnnll-strip-space", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("jcnnll-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
