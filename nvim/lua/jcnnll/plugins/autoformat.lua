return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                }
            end
        end,
        formatters = {
            phpcbf = {
                command = "phpcbf",
                args = { "-q", "--standard=WordPress", "--report-json", "$FILENAME" },
            },
        },
        formatters_by_ft = {
            css = { "prettier" },
            go = { "gofmt" },
            graphql = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            json = { "prettier" },
            liquid = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            php = { "phpcbf" },
            python = { "isort", "black" },
            typescript = { "prettir" },
            typescriptreact = { "prettier" },
            yaml = { "prettier" },
        },
    },
}
