-- Set <space> as leader (must happen before other plugins loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Relative line numbers
vim.o.relativenumber = true
vim.o.number = true -- display absolute line number instead of 0

-- Case-insensitive searching unless we use capital letters
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sync vim and system clipboards
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Copy to clipboard shortcuts
vim.keymap.set("n", "<leader>cp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy absolute path" })

vim.keymap.set("n", "<leader>cr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy relative path" })

-- Raise dialog if you close unsaved buffer (prevent mistakes)
vim.o.confirm = true

-- Disable swap files to prevent annoying errors
vim.opt.swapfile = false

-- Snappy escape
vim.o.ttimeoutlen = 1

-- Vim diagnostics
vim.diagnostic.config({
	severity_sort = true, -- show most severe error first
	update_in_insert = false, -- don't update while typing
	float = { source = "if_many" }, -- nicer look for floats and show source if multiple sources (ex. ruff and ty)
	jump = { float = true }, -- automatically open the diagnostic float if you jump with [d ]d
})

-- Show diagnostics
vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Easily move between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Plugins
-- Pack guide: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#update
vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-treesitter/nvim-treesitter", -- also $ brew install tree-sitter-cli
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") }, -- pinning so rust binary dependency automatically downloads
})

-- Rose Pine
require("rose-pine").setup({
	variant = "dawn",
	styles = {
		bold = true,
		italic = true,
		transparency = false, -- Set to true if you want a see-through terminal background
	},
})
vim.cmd("colorscheme rose-pine") -- need to call after setup

-- Markdown
require("render-markdown").setup({})

-- FzfLua Setup
local fzf = require("fzf-lua")
fzf.setup({
	ui_select = true,
	keymap = {
		builtin = {
			["<C-d>"] = "preview-page-down", -- Better scrolling within the displays
			["<C-u>"] = "preview-page-up",
		},
	},
	winopts = {
		height = 0.95, -- window height
		width = 0.90, -- window width
		preview = {
			layout = "vertical",
			vertical = "down:30%",
		},
	},
	files = {
		formatter = "path.filename_first",
	},
	fzf_colors = {
		true,
	},
})

vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Find live grep" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>,", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })

vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "References" })
vim.keymap.set("n", "gri", fzf.lsp_implementations, { desc = "Implementations" })
vim.keymap.set("n", "gra", fzf.lsp_code_actions, { desc = "Code actions" })
vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Go to definition" })
-- Treesitter
vim.cmd("syntax off") -- Make it obvious if treesitter is missing
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- LSP
vim.lsp.enable({
	"ty", -- also $ uv tool install ty@latest
	"ruff", -- also $ uv tool install ruff@latest
	"lua_ls", -- also $ brew install lua-language-server
})
vim.o.signcolumn = "yes" -- make lsp warnings not widen the gutter
-- Auto-format ("lint") on save (adapted from neovim docs :help auto-format)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp.fmt", { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
-- Blink.cmp
require("blink.cmp").setup({
	signature = {
		enabled = true,
		window = { show_documentation = false },
	},
})

-- Neoscroll
require("neoscroll").setup({
	hide_cursor = false,
	stop_eof = true,
	easing = "quadratic",
	duration_multiplier = 0.30,
})

-- Dap (debugging)
local dap = require("dap")
dap.adapters.debugpy = function(cb, config) -- also $ uv tool install debugpy@latest
	if config.request == "attach" then
		cb({
			type = "server",
			port = config.connect.port,
			host = config.connect.host or "127.0.0.1",
		})
	else
		cb({
			type = "executable",
			command = "debugpy-adapter",
		})
	end
end
dap.configurations.python = { -- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
	{
		type = "debugpy",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		python = function()
			local root = vim.fs.root(0, ".venv")
			return { root and root .. "/.venv/bin/python" or "python3" }
		end,
		cwd = function()
			return vim.fs.root(0, ".venv") or vim.fn.getcwd()
		end,
	},
}
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug continue" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debug terminate" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug run last" })
vim.keymap.set({ "n", "v" }, "<leader>dh", require("dap.ui.widgets").hover, { desc = "Debug hover" })
vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Debug step over" })
vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Debug step into" })
vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Debug step out" })
vim.keymap.set("n", "<Up>", dap.restart_frame, { desc = "Debug restart frame" })

-- Oil.nvim
require("oil").setup({
	columns = { "mtime" },
	view_options = {
		show_hidden = true,
		sort = {
			{ "type", "asc" },
			{ "mtime", "desc" },
		},
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Lazygit.nvim
local function git_line_history(start_line, end_line)
	start_line, end_line = math.min(start_line, end_line), math.max(start_line, end_line)
	local range = start_line .. "," .. end_line .. ":" .. vim.fn.expand("%:t")
	local command = { "git", "-C", vim.fn.expand("%:p:h"), "--no-pager", "log", "-L", range }
	local output = vim.fn.systemlist(command)
	local command_text = vim.fn.join(vim.tbl_map(vim.fn.shellescape, command), " ")

	vim.cmd("vnew")
	vim.bo.buftype = "nofile"
	vim.bo.filetype = "diff"
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.list_extend({ command_text, "" }, output))
	vim.bo.modified = false
end

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gb", function()
	vim.ui.open(vim.fn.systemlist("git remote get-url origin")[1])
end, { desc = "Open git remote" })
vim.keymap.set("n", "<leader>gl", function()
	git_line_history(vim.fn.line("."), vim.fn.line("."))
end, { desc = "Git line history" })
vim.keymap.set("v", "<leader>gl", function()
	git_line_history(vim.fn.line("v"), vim.fn.line("."))
end, { desc = "Git line history" })

-- Codediff (vscode like diffs :))
require("codediff").setup({})
vim.keymap.set("n", "<leader>ru", "<cmd>CodeDiff<cr>", { desc = "Code diff not staged" })
vim.keymap.set("n", "<leader>rm", "<cmd>CodeDiff main<cr>", { desc = "Code diff main" })
vim.keymap.set("n", "<leader>rh", "<cmd>CodeDiff HEAD~1<cr>", { desc = "Code diff previous commit" })

