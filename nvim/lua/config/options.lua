-----------------------------------------------------------
-- General
-----------------------------------------------------------

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Number of spaces a tab represents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Use appropriate tab spacing when using indent command
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Indenting correctly after { etc
vim.opt.smartindent = true

-- Copy indent from current line when starting new line
vim.opt.autoindent = true

-- Prevent line wrapping
vim.opt.breakindent = true

-- Disable text wrap
vim.opt.wrap = false

-- Speeds up plugin wait time
vim.opt.updatetime = 50

-- Persistant undo file history
vim.opt.undofile = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-----------------------------------------------------------
-- UI Config
-----------------------------------------------------------

-- Disable netrw
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- Enable line numbers and relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Disable showing the mode below the statusline
vim.opt.showmode = false

-- Better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes:2"

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Faster scrolling
vim.opt.lazyredraw = true

-- Turn off cursorline
vim.opt.cursorline = false

-- Highlight yank
vim.api.nvim_create_autocmd("textyankpost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})

-- remove the ~ from end of buffer
vim.opt.fillchars:append({ eob = " " })

-----------------------------------------------------------
-- Search Config
-----------------------------------------------------------

-- Enable highlighting search in progress
vim.opt.incsearch = true

-- Ignore case for searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-----------------------------------------------
-- Autocmds
-----------------------------------------------

-- Strip whitespace from files on write
vim.api.nvim_create_autocmd("BufwritePre", {
  group = vim.api.nvim_create_augroup("strip-space", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-----------------------------------------------
-- Diagnostic Config
-----------------------------------------------

vim.diagnostic.config({
  severity_sort = true,
  float = { source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  virtual_lines = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})
