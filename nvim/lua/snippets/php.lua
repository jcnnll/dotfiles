local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("wpph", {
        t({ "/*" }),
        t({ "", "  Plugin Name: " }),
        i(1),
        t({ "", "  Description: Custom plugin for " }),
        i(2),
        t({ "", "  Version: 1.0" }),
        t({ "", "  Author: jcnnll" }),
        t({ "", "  Author URI: https://jcnnll.dev" }),
        t({ "", "*/" }),
        t({ "", "" }),
        i(0),
    }),
}
