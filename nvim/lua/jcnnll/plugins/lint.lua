return {
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            "williamboman/mason.nvim",
        },
        lazy = true,
        event = { "BufWritePost", "InsertLeave" },
        keys = {
            {
                "<leader>l",
                function()
                    require("lint").try_lint()
                end,
                desc = "Trigger linting for current file",
            },
        },
        config = function()
            local lint = require("lint")
            local phpcs = lint.linters.phpcs
            phpcs.cmd = "/Users/jay/.composer/vendor/bin/phpcs"
            phpcs.args = {
                "-q",
                "--standard=WordPress",
                "--report=json",
            }

            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                php = { "phpcs" },
                python = { "pylint" },
            }

            -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            --     group = lint_augroup,
            --     callback = function()
            --         if vim.bo.modifiable then
            --             lint.try_lint()
            --         end
            --     end,
            -- })
        end,
    },
}
