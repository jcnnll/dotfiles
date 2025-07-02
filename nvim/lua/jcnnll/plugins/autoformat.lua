return {
    "stevearc/conform.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end,
            desc = "[F]ormat buffer",
        },
    },
    config = function()
        require("conform").setup({
            formatters = {
                phpcbf = {
                    command = "/Users/jay/.composer/vendor/bin/phpcbf",
                    args = { "--standard=WordPress", "$FILENAME" },
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
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                yaml = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })
    end,
}
