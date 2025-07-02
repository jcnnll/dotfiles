local state = {
    buf = -1,
    win = -1,
}

local function open_floating_terminal()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Create a terminal buffer
    state.buf = vim.api.nvim_create_buf(false, true)

    -- Open a floating window with that buffer
    state.win = vim.api.nvim_open_win(state.buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Switch to the buffer and run the shell using :terminal
    vim.api.nvim_set_current_buf(state.buf)
    vim.cmd("terminal")
    vim.cmd("startinsert!")
end

local function toggle_terminal()
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_hide(state.win)
    else
        open_floating_terminal()
    end
end

-- Keybinding: Open/Close terminal with <leader>ft
vim.api.nvim_create_user_command("Fterm", toggle_terminal, {})
vim.keymap.set("n", "<leader>ft", toggle_terminal, { noremap = true, silent = true })

-- Keybinding: Close terminal with <esc><esc> inside terminal mode
vim.keymap.set("t", "<esc><esc>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_hide(state.win)
    end
end, { noremap = true, silent = true })
