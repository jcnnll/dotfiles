return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        -- Snippet Engine
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = (function()
                return "make install_jsregexp"
            end)(),
            dependencies = {},
            opts = {},
        },
        "folke/lazydev.nvim",
    },
    opts = {
        keymap = {
            preset = "default",
        },

        snippets = { preset = "luasnip" },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true },
    },
    opts_extend = {
        "sources.completion.enabled_providers",
        "sources.compat",
        "sources.default",
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)
    end,
}
