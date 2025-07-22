return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local lua_snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"

        -- Load VSCode-style JSON snippets (optional, you can keep or remove)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Load native Lua snippets
        require("luasnip.loaders.from_lua").load({ paths = { lua_snippet_path } })

        -- Optional: extend snippets between filetypes
        require("luasnip").filetype_extend("php", { "html" })
    end,
}
